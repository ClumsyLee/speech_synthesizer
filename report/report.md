# 语音合成综合实验

## 1. 语音预测模型

### 1.1 分析滤波器

    e(n) = s(n) - a1 * s(n - 1) - a2 * s(n - 2)

由 Z 变换可以直接得到传递函数：

    H(z) = 1 / (1 - a1 * z^-1 - a2 * z^-2)

用 `zplane`, `freqz`, `impz` 分别绘出零极点分布图，频率响应和单位样值响应，并用 `filter` 函数画出单位样值响应：

```matlab
close all

a = [1, -1.3789, 0.9506];
b = 1;
n = [0:100];
x = (n == 0);
f_sample = 8000;

zplane(b, a);
saveas(gcf, '../report/zplane', 'png');

figure
[H, F] = freqz(b, a, 512, f_sample);
[max_value, max_index] = max(H);
fprintf('Formant = %.2f Hz\n', F(max_index));

saveas(gcf, '../report/freqz', 'png');

figure
subplot 211
impz(b, a, n);
subplot 212
y = filter(b, a, x);
stem(n, y);
saveas(gcf, '../report/impz_filter', 'png');
```

输出：

    Formant = 1000.00 Hz

![zplane](zplane.png)

![freqz](freqz.png)

![impz & filter](impz_filter.png)

可以看到，通过 `impz` 和 `filter` 得到的单位样值响应没有区别。

### 1.2 理解 `speechproc.m` 的基本流程

基本的流程如下：

1. 载入语音信号；
2. 对语音信号的每一帧做如下操作：
    1. 计算该帧的预测系数；
    2. 利用语音预测模型计算该帧激励信号；
    3. 利用语音重建模型，使用激励信号计算该帧的重建语音；
    4. 计算该段 PT 和合成激励的能量，并用其生成合成激励，生成语音；
    5. 用增长的合成激励生成语音，变速不变调；
    6. 减小基音周期，增大谐振峰，合成语音，变调不变速；
3. 保存所有激励和语音；

其中 PCM 文件中数据都是以 `int16` 的形式保存的。

### 1.3 观察 27 帧时的零极点分布

直接调用 `zplane` 即可：

```matlab
if n == 27
    % (3) 在此位置写程序，观察预测系统的零极点图
    zplane(1, A);
end
```

结果如图，一共有 5 对共轭的极点。

![Z plane on frame 27](zplane_27.png)

### 1.4 计算激励信号 `e(n)`

利用原先代码中计算好的预测系数，可以直接使用 `filter` 函数计算出 `e(n)`。

需要注意的是，为了在系数变化的情况下连续滤波，应该将滤波器的状态保存在 `zi_pre` 中。代码如下：

```matlab
% (4) 在此位置写程序，用filter函数s_f计算激励，注意保持滤波器状态
[exc((n-1)*FL+1:n*FL), zi_pre)] = filter(A, 1, s_f, zi_pre);
```

### 1.5

### 1.6

### 1.7

## 2. 语音合成模型

### 2.1

### 2.2

### 2.3

### 2.4

## 3. 变速不变调

### 3.1

### 3.2

## 4. 变调不变速

### 4.1

### 4.2
