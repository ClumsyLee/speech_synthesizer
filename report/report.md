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
f_peak = F(max_index)

saveas(gcf, '../report/freqz', 'png');

figure
subplot 211
impz(b, a, n);
subplot 212
y = filter(b, a, x);
stem(n, y);
saveas(gcf, '../report/impz_filter', 'png');
```

结果如图：

    f_peak =
    
            1000

![zplane](zplane.png)

![freqz](freqz.png)

![impz & filter](impz_filter)

### 1.2

### 1.3

### 1.4

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
