import matplotlib.pyplot as plt
import numpy as np

versions = ['22.1.0', '23.1.0', '24.1.0', '25.1.0', '26.1.0']
besu =   [348, 391, 446, 427, 435]
teku =   [351, 392, 444, 422, 466]
common = [195, 207, 218, 243, 264]

x = np.arange(len(versions))
width = 0.25

# Colors from the uploaded chart
PINK   = '#FF007F'
BLUE   = '#00BFFF'
YELLOW = '#FFD700'

fig, ax = plt.subplots(figsize=(11, 6.5))
fig.patch.set_facecolor('#E8F5D0')
ax.set_facecolor('#FCE4F0')

b1 = ax.bar(x - width, besu,   width, color=PINK,   label='Besu',   zorder=3)
b2 = ax.bar(x,         teku,   width, color=BLUE,   label='Teku',   zorder=3)
b3 = ax.bar(x - width/2, common, width, color=YELLOW, label='Common', zorder=3)

for bars, vals in [(b1, besu), (b2, teku), (b3, common)]:
    for bar, val in zip(bars, vals):
        ax.text(bar.get_x() + bar.get_width()/2, val + 4, str(val),
                ha='center', va='bottom', fontsize=9)

ax.set_xlabel('Version Number', fontsize=12)
ax.set_ylabel('Number of Dependencies', fontsize=12)
ax.set_title('Dependencies by Version', fontsize=14)
ax.set_xticks(x)
ax.set_xticklabels(versions)
ax.set_ylim(0, 530)
ax.legend(fontsize=11)
ax.grid(axis='y', linestyle='--', alpha=0.5, zorder=0)
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)

plt.tight_layout()
plt.show()
plt.savefig('besu_teku_common.png', bbox_inches='tight')
plt.savefig('dependencies_stacked.png', dpi=150, bbox_inches='tight')

# print("Saved.")