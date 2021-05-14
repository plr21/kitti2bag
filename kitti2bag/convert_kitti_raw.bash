#!/bin/bash

sequences_09_26=(0001
0002
0005
0009
0011
0013
0014
0015
0017
0018
0019
0020
0022
0023
0027
0028
0029
0032
0035
0036
0039
0046
0048
0051
0052
0056
0057
0059
0060
0061
0064
0070
0079
0084
0086
0087
0091
0093
0095
0096
0101
0104
0106
0113
0117
0119)

sequences_09_28=(0001
0002
0016
0021
0034
0035
0037
0038
0039
0043
0045
0047
0053
0054
0057
0065
0066
0068
0070
0071
0075
0077
0078
0080
0082
0086
0087
0089
0090
0094
0095
0096
0098
0100
0102
0103
0104
0106
0108
0110
0113
0117
0119
0121
0122
0125
0126
0128
0132
0134
0135
0136
0138
0141
0143
0145
0146
0149
0153
0154
0155
0156
0160
0161
0162
0165
0166
0167
0168
0171
0174
0177
0179
0183
0184
0185
0186
0187
0191
0192
0195
0198
0199
0201
0204
0205
0208
0209
0214
0216
0220
0222
0225)

sequences_09_29=(0004
0026
0071
0108)

sequences_09_30=(0016
0018
0020
0027
0028
0033
0034
0072)

sequences_10_03=(0027
0034
0042
0047
0058)

kitti2bag_path="/home/sweber/kitti2bag/kitti2bag/kitti2bag.py"
input_dir="/media/scratch2/PLR-vSLAM/kitti_raw"

# 1st argument: string of date
# other arguments: array of sequences
convert_to_bag() {
	date="$1"
	sequences=("$@")
	unset sequences[0]
	for i in "${sequences[@]}"
	do
		echo "Processing ${date} ${i}"
		python $kitti2bag_path raw_synced $input_dir -t $date -r $i
	done
}

echo "Saving to: "
pwd

# Run conversions in parallel processes
convert_to_bag 2011_09_26 "${sequences_09_26[@]}" &
convert_to_bag 2011_09_28 "${sequences_09_28[@]}" &
convert_to_bag 2011_09_29 "${sequences_09_29[@]}" &
convert_to_bag 2011_09_30 "${sequences_09_30[@]}" &
convert_to_bag 2011_10_03 "${sequences_10_03[@]}" &
