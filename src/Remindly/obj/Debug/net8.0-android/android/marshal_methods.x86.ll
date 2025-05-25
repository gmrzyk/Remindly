; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [207 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [408 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 26230656, ; 3: Microsoft.Extensions.DependencyModel => 0x1903f80 => 183
	i32 32687329, ; 4: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 198
	i32 34715100, ; 5: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 202
	i32 34839235, ; 6: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 8: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 9: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 82292897, ; 11: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 117431740, ; 12: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 122350210, ; 13: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 142721839, ; 14: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 15: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 16: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 17: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 195
	i32 176265551, ; 18: System.ServiceProcess => 0xa81994f => 132
	i32 184328833, ; 19: System.ValueTuple.dll => 0xafca281 => 151
	i32 205061960, ; 20: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 21: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 194
	i32 220171995, ; 22: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230752869, ; 23: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 24: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 25: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 26: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 276479776, ; 27: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 291076382, ; 28: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 29: System.Net.Ping.dll => 0x11d123fd => 69
	i32 321597661, ; 30: System.Numerics => 0x132b30dd => 83
	i32 342366114, ; 31: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 197
	i32 347068432, ; 32: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 190
	i32 360082299, ; 33: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 34: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 35: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 36: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 37: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 38: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 39: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 40: _Microsoft.Android.Resource.Designer => 0x17969339 => 203
	i32 403441872, ; 41: WindowsBase => 0x180c08d0 => 165
	i32 411679681, ; 42: Remindly => 0x1889bbc1 => 0
	i32 442521989, ; 43: Xamarin.Essentials => 0x1a605985 => 201
	i32 442565967, ; 44: System.Collections => 0x1a61054f => 12
	i32 451504562, ; 45: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 46: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 47: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 48: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 49: System.dll => 0x1bff388e => 164
	i32 498788369, ; 50: System.ObjectModel => 0x1dbae811 => 84
	i32 513247710, ; 51: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 187
	i32 526420162, ; 52: System.Transactions.dll => 0x1f6088c2 => 150
	i32 530272170, ; 53: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 54: Microsoft.Extensions.Logging => 0x20216150 => 184
	i32 540030774, ; 55: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 56: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 57: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 58: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 577335427, ; 59: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 601371474, ; 60: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 61: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 62: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 643868501, ; 63: System.Net => 0x2660a755 => 81
	i32 662205335, ; 64: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 65: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 200
	i32 666292255, ; 66: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 193
	i32 672442732, ; 67: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 68: System.Net.Security => 0x28bdabca => 73
	i32 690569205, ; 69: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 693804605, ; 70: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 71: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700358131, ; 72: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 722857257, ; 73: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 74: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 748832960, ; 75: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 188
	i32 752232764, ; 76: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 759454413, ; 77: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 78: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 79: System.IO.Compression => 0x2e394f87 => 46
	i32 789151979, ; 80: Microsoft.Extensions.Options => 0x2f0980eb => 186
	i32 804715423, ; 81: System.Data.Common => 0x2ff6fb9f => 22
	i32 823281589, ; 82: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 83: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 84: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 85: System.Net.Quic => 0x31b69d60 => 71
	i32 873119928, ; 86: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 87: System.Globalization.dll => 0x34505120 => 42
	i32 878948057, ; 88: Remindly.dll => 0x3463aed9 => 0
	i32 878954865, ; 89: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 90: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 91: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 928116545, ; 92: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 202
	i32 952186615, ; 93: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 967690846, ; 94: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 197
	i32 975236339, ; 95: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 96: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 97: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 98: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 99: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 100: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 101: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1019214401, ; 102: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 103: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 182
	i32 1036536393, ; 104: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 105: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1082857460, ; 106: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1098259244, ; 107: System => 0x41761b2c => 164
	i32 1157931901, ; 108: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 175
	i32 1170634674, ; 109: System.Web.dll => 0x45c677b2 => 153
	i32 1202000627, ; 110: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 175
	i32 1204270330, ; 111: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 193
	i32 1204575371, ; 112: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 179
	i32 1208641965, ; 113: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 114: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1253011324, ; 115: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1292207520, ; 116: SQLitePCLRaw.core.dll => 0x4d0585a0 => 189
	i32 1309188875, ; 117: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1324164729, ; 118: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 119: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 120: System.IO => 0x514d38cd => 57
	i32 1379779777, ; 121: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 122: System.Configuration.dll => 0x53936ab4 => 19
	i32 1408764838, ; 123: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 124: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 125: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1434145427, ; 126: System.Runtime.Handles => 0x557b5293 => 104
	i32 1439761251, ; 127: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 128: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 129: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 130: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 131: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461234159, ; 132: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 133: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 134: System.IO.Compression.dll => 0x57261233 => 46
	i32 1470490898, ; 135: Microsoft.Extensions.Primitives => 0x57a5e912 => 187
	i32 1479771757, ; 136: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 137: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 138: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490351284, ; 139: Microsoft.Data.Sqlite.dll => 0x58d4f4b4 => 173
	i32 1536373174, ; 140: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 141: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 142: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 143: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1565862583, ; 144: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 145: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 146: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 147: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1592978981, ; 148: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1601112923, ; 149: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 150: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 151: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622358360, ; 152: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1639515021, ; 153: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 154: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 155: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 156: System.Runtime => 0x62c6282e => 116
	i32 1675553242, ; 157: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 158: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 159: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 160: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1688112883, ; 161: Microsoft.Data.Sqlite => 0x649e8ef3 => 173
	i32 1689493916, ; 162: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 174
	i32 1691477237, ; 163: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 164: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1701541528, ; 165: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1711441057, ; 166: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 190
	i32 1726116996, ; 167: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 168: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1744735666, ; 169: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 170: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 171: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 172: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 173: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 174: System.Reflection.Extensions => 0x6942234e => 93
	i32 1770582343, ; 175: Microsoft.Extensions.Logging.dll => 0x6988f147 => 184
	i32 1776026572, ; 176: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 177: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 178: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1818787751, ; 179: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 180: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 181: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 182: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 185
	i32 1858542181, ; 183: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1867746548, ; 184: Xamarin.Essentials.dll => 0x6f538cf4 => 201
	i32 1870277092, ; 185: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1879696579, ; 186: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1886040351, ; 187: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x706ab11f => 177
	i32 1888955245, ; 188: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 189: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 190: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 191: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 192: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1919157823, ; 193: Xamarin.AndroidX.MultiDex.dll => 0x7264063f => 199
	i32 1939592360, ; 194: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 195: System.Resources.Writer => 0x74a1c5bb => 100
	i32 2011961780, ; 196: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2014489277, ; 197: Microsoft.EntityFrameworkCore.Sqlite => 0x7812aabd => 177
	i32 2045470958, ; 198: System.Private.Xml => 0x79eb68ee => 88
	i32 2060060697, ; 199: System.Windows.dll => 0x7aca0819 => 154
	i32 2070888862, ; 200: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 201: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 202: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2103459038, ; 203: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 191
	i32 2127167465, ; 204: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 205: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 206: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 207: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2181898931, ; 208: Microsoft.Extensions.Options.dll => 0x820d22b3 => 186
	i32 2192057212, ; 209: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 185
	i32 2193016926, ; 210: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2197979891, ; 211: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 183
	i32 2201231467, ; 212: System.Net.Http => 0x8334206b => 64
	i32 2222056684, ; 213: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2252106437, ; 214: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2252897993, ; 215: Microsoft.EntityFrameworkCore => 0x86487ec9 => 174
	i32 2256313426, ; 216: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2256548716, ; 217: Xamarin.AndroidX.MultiDex => 0x8680336c => 199
	i32 2265110946, ; 218: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 219: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 180
	i32 2293034957, ; 220: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 221: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 222: System.Net.Mail => 0x88ffe49e => 66
	i32 2305521784, ; 223: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 224: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 192
	i32 2320631194, ; 225: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 226: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 227: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 228: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 229: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2378619854, ; 230: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 231: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2401565422, ; 232: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2421380589, ; 233: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2435356389, ; 234: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 235: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 236: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 237: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 238: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465273461, ; 239: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 188
	i32 2471841756, ; 240: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 241: Java.Interop.dll => 0x93918882 => 168
	i32 2483903535, ; 242: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 243: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 244: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 245: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 246: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 198
	i32 2538310050, ; 247: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2562349572, ; 248: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 249: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2585220780, ; 250: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 251: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 252: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2617129537, ; 253: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 254: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2627185994, ; 255: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 256: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2634653062, ; 257: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 176
	i32 2663698177, ; 258: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 259: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 260: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 261: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 262: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 263: System.IO.dll => 0xa090e36a => 57
	i32 2715334215, ; 264: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 265: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 266: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 267: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2735172069, ; 268: System.Threading.Channels => 0xa30769e5 => 139
	i32 2740948882, ; 269: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 270: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2765824710, ; 271: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2803228030, ; 272: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2819470561, ; 273: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 274: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2824502124, ; 275: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2847789619, ; 276: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 176
	i32 2849599387, ; 277: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2861098320, ; 278: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2875220617, ; 279: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2887636118, ; 280: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 281: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 282: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 283: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 284: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 285: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2919462931, ; 286: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2936416060, ; 287: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 288: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 289: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 290: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 291: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 292: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 3023353419, ; 293: WindowsBase.dll => 0xb434b64b => 165
	i32 3038032645, ; 294: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 203
	i32 3059408633, ; 295: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 296: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3069363400, ; 297: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 178
	i32 3075834255, ; 298: System.Threading.Tasks => 0xb755818f => 144
	i32 3090735792, ; 299: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 300: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 301: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 302: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 303: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 304: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 305: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 306: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3159123045, ; 307: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 308: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3192346100, ; 309: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 310: System.Web => 0xbe592c0c => 153
	i32 3195844289, ; 311: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 178
	i32 3204380047, ; 312: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 313: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3220365878, ; 314: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 315: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 316: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3265493905, ; 317: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 318: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 319: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 320: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 321: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 322: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 323: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 324: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3316684772, ; 325: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317144872, ; 326: System.Data => 0xc5b79d28 => 24
	i32 3358260929, ; 327: System.Text.Json => 0xc82afec1 => 137
	i32 3360279109, ; 328: SQLitePCLRaw.core => 0xc849ca45 => 189
	i32 3362522851, ; 329: Xamarin.AndroidX.Core => 0xc86c06e3 => 196
	i32 3366347497, ; 330: Java.Interop => 0xc8a662e9 => 168
	i32 3395150330, ; 331: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 332: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3428513518, ; 333: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 181
	i32 3429136800, ; 334: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 335: netstandard => 0xcc7d82b4 => 167
	i32 3445260447, ; 336: System.Formats.Tar => 0xcd5a809f => 39
	i32 3471940407, ; 337: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 338: Mono.Android => 0xcf3163e6 => 171
	i32 3485117614, ; 339: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 340: System.Transactions => 0xcfd0c798 => 150
	i32 3509114376, ; 341: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 342: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 343: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 344: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 345: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 346: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3598340787, ; 347: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 348: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 349: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3638274909, ; 350: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3645089577, ; 351: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 352: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 180
	i32 3660523487, ; 353: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 354: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 355: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 194
	i32 3700866549, ; 356: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3716563718, ; 357: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 358: Xamarin.AndroidX.Annotation => 0xdda814c6 => 192
	i32 3732100267, ; 359: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 360: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 361: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 362: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3754567612, ; 363: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 191
	i32 3786282454, ; 364: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 195
	i32 3792276235, ; 365: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3802395368, ; 366: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 367: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 368: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 369: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 370: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 182
	i32 3844307129, ; 371: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 372: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 373: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 374: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 375: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 376: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3896106733, ; 377: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 378: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 196
	i32 3901907137, ; 379: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 380: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 381: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 200
	i32 3928044579, ; 382: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 383: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3945713374, ; 384: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 385: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 4003436829, ; 386: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4025784931, ; 387: System.Memory => 0xeff49a63 => 62
	i32 4054681211, ; 388: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 389: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 390: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4099507663, ; 391: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 392: System.Private.Uri => 0xf462c30d => 86
	i32 4101842092, ; 393: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 179
	i32 4126470640, ; 394: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 181
	i32 4127667938, ; 395: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 396: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 397: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4151237749, ; 398: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 399: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 400: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 401: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 402: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4185676441, ; 403: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 404: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 405: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4260525087, ; 406: System.Buffers => 0xfdf2741f => 7
	i32 4274976490 ; 407: System.Runtime.Numerics => 0xfecef6ea => 110
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [408 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 183, ; 3
	i32 198, ; 4
	i32 202, ; 5
	i32 48, ; 6
	i32 80, ; 7
	i32 145, ; 8
	i32 30, ; 9
	i32 124, ; 10
	i32 102, ; 11
	i32 107, ; 12
	i32 139, ; 13
	i32 77, ; 14
	i32 124, ; 15
	i32 13, ; 16
	i32 195, ; 17
	i32 132, ; 18
	i32 151, ; 19
	i32 18, ; 20
	i32 194, ; 21
	i32 26, ; 22
	i32 1, ; 23
	i32 59, ; 24
	i32 42, ; 25
	i32 91, ; 26
	i32 147, ; 27
	i32 54, ; 28
	i32 69, ; 29
	i32 83, ; 30
	i32 197, ; 31
	i32 190, ; 32
	i32 131, ; 33
	i32 55, ; 34
	i32 149, ; 35
	i32 74, ; 36
	i32 145, ; 37
	i32 62, ; 38
	i32 146, ; 39
	i32 203, ; 40
	i32 165, ; 41
	i32 0, ; 42
	i32 201, ; 43
	i32 12, ; 44
	i32 125, ; 45
	i32 152, ; 46
	i32 113, ; 47
	i32 166, ; 48
	i32 164, ; 49
	i32 84, ; 50
	i32 187, ; 51
	i32 150, ; 52
	i32 60, ; 53
	i32 184, ; 54
	i32 51, ; 55
	i32 103, ; 56
	i32 114, ; 57
	i32 40, ; 58
	i32 120, ; 59
	i32 52, ; 60
	i32 44, ; 61
	i32 119, ; 62
	i32 81, ; 63
	i32 136, ; 64
	i32 200, ; 65
	i32 193, ; 66
	i32 8, ; 67
	i32 73, ; 68
	i32 155, ; 69
	i32 154, ; 70
	i32 92, ; 71
	i32 45, ; 72
	i32 109, ; 73
	i32 129, ; 74
	i32 188, ; 75
	i32 25, ; 76
	i32 72, ; 77
	i32 55, ; 78
	i32 46, ; 79
	i32 186, ; 80
	i32 22, ; 81
	i32 86, ; 82
	i32 43, ; 83
	i32 160, ; 84
	i32 71, ; 85
	i32 3, ; 86
	i32 42, ; 87
	i32 0, ; 88
	i32 63, ; 89
	i32 16, ; 90
	i32 53, ; 91
	i32 202, ; 92
	i32 105, ; 93
	i32 197, ; 94
	i32 34, ; 95
	i32 158, ; 96
	i32 85, ; 97
	i32 32, ; 98
	i32 12, ; 99
	i32 51, ; 100
	i32 56, ; 101
	i32 36, ; 102
	i32 182, ; 103
	i32 35, ; 104
	i32 58, ; 105
	i32 17, ; 106
	i32 164, ; 107
	i32 175, ; 108
	i32 153, ; 109
	i32 175, ; 110
	i32 193, ; 111
	i32 179, ; 112
	i32 29, ; 113
	i32 52, ; 114
	i32 5, ; 115
	i32 189, ; 116
	i32 85, ; 117
	i32 61, ; 118
	i32 112, ; 119
	i32 57, ; 120
	i32 99, ; 121
	i32 19, ; 122
	i32 111, ; 123
	i32 101, ; 124
	i32 102, ; 125
	i32 104, ; 126
	i32 71, ; 127
	i32 38, ; 128
	i32 32, ; 129
	i32 103, ; 130
	i32 73, ; 131
	i32 9, ; 132
	i32 123, ; 133
	i32 46, ; 134
	i32 187, ; 135
	i32 9, ; 136
	i32 43, ; 137
	i32 4, ; 138
	i32 173, ; 139
	i32 31, ; 140
	i32 138, ; 141
	i32 92, ; 142
	i32 93, ; 143
	i32 49, ; 144
	i32 141, ; 145
	i32 112, ; 146
	i32 140, ; 147
	i32 115, ; 148
	i32 157, ; 149
	i32 76, ; 150
	i32 79, ; 151
	i32 37, ; 152
	i32 64, ; 153
	i32 138, ; 154
	i32 15, ; 155
	i32 116, ; 156
	i32 48, ; 157
	i32 70, ; 158
	i32 80, ; 159
	i32 126, ; 160
	i32 173, ; 161
	i32 174, ; 162
	i32 94, ; 163
	i32 121, ; 164
	i32 26, ; 165
	i32 190, ; 166
	i32 97, ; 167
	i32 28, ; 168
	i32 149, ; 169
	i32 169, ; 170
	i32 4, ; 171
	i32 98, ; 172
	i32 33, ; 173
	i32 93, ; 174
	i32 184, ; 175
	i32 21, ; 176
	i32 41, ; 177
	i32 170, ; 178
	i32 2, ; 179
	i32 134, ; 180
	i32 111, ; 181
	i32 185, ; 182
	i32 58, ; 183
	i32 201, ; 184
	i32 95, ; 185
	i32 39, ; 186
	i32 177, ; 187
	i32 25, ; 188
	i32 94, ; 189
	i32 89, ; 190
	i32 99, ; 191
	i32 10, ; 192
	i32 199, ; 193
	i32 87, ; 194
	i32 100, ; 195
	i32 7, ; 196
	i32 177, ; 197
	i32 88, ; 198
	i32 154, ; 199
	i32 33, ; 200
	i32 116, ; 201
	i32 82, ; 202
	i32 191, ; 203
	i32 20, ; 204
	i32 11, ; 205
	i32 162, ; 206
	i32 3, ; 207
	i32 186, ; 208
	i32 185, ; 209
	i32 84, ; 210
	i32 183, ; 211
	i32 64, ; 212
	i32 143, ; 213
	i32 157, ; 214
	i32 174, ; 215
	i32 41, ; 216
	i32 199, ; 217
	i32 117, ; 218
	i32 180, ; 219
	i32 131, ; 220
	i32 75, ; 221
	i32 66, ; 222
	i32 172, ; 223
	i32 192, ; 224
	i32 143, ; 225
	i32 106, ; 226
	i32 151, ; 227
	i32 70, ; 228
	i32 156, ; 229
	i32 121, ; 230
	i32 127, ; 231
	i32 152, ; 232
	i32 141, ; 233
	i32 20, ; 234
	i32 14, ; 235
	i32 135, ; 236
	i32 75, ; 237
	i32 59, ; 238
	i32 188, ; 239
	i32 167, ; 240
	i32 168, ; 241
	i32 15, ; 242
	i32 74, ; 243
	i32 6, ; 244
	i32 23, ; 245
	i32 198, ; 246
	i32 91, ; 247
	i32 1, ; 248
	i32 136, ; 249
	i32 134, ; 250
	i32 69, ; 251
	i32 146, ; 252
	i32 88, ; 253
	i32 96, ; 254
	i32 31, ; 255
	i32 45, ; 256
	i32 176, ; 257
	i32 109, ; 258
	i32 158, ; 259
	i32 35, ; 260
	i32 22, ; 261
	i32 114, ; 262
	i32 57, ; 263
	i32 144, ; 264
	i32 118, ; 265
	i32 120, ; 266
	i32 110, ; 267
	i32 139, ; 268
	i32 54, ; 269
	i32 105, ; 270
	i32 133, ; 271
	i32 159, ; 272
	i32 163, ; 273
	i32 132, ; 274
	i32 161, ; 275
	i32 176, ; 276
	i32 140, ; 277
	i32 169, ; 278
	i32 40, ; 279
	i32 81, ; 280
	i32 56, ; 281
	i32 37, ; 282
	i32 97, ; 283
	i32 166, ; 284
	i32 172, ; 285
	i32 82, ; 286
	i32 98, ; 287
	i32 30, ; 288
	i32 159, ; 289
	i32 18, ; 290
	i32 127, ; 291
	i32 119, ; 292
	i32 165, ; 293
	i32 203, ; 294
	i32 170, ; 295
	i32 16, ; 296
	i32 178, ; 297
	i32 144, ; 298
	i32 125, ; 299
	i32 118, ; 300
	i32 38, ; 301
	i32 115, ; 302
	i32 47, ; 303
	i32 142, ; 304
	i32 117, ; 305
	i32 34, ; 306
	i32 95, ; 307
	i32 53, ; 308
	i32 129, ; 309
	i32 153, ; 310
	i32 178, ; 311
	i32 24, ; 312
	i32 161, ; 313
	i32 148, ; 314
	i32 104, ; 315
	i32 89, ; 316
	i32 60, ; 317
	i32 142, ; 318
	i32 100, ; 319
	i32 5, ; 320
	i32 13, ; 321
	i32 122, ; 322
	i32 135, ; 323
	i32 28, ; 324
	i32 72, ; 325
	i32 24, ; 326
	i32 137, ; 327
	i32 189, ; 328
	i32 196, ; 329
	i32 168, ; 330
	i32 101, ; 331
	i32 123, ; 332
	i32 181, ; 333
	i32 163, ; 334
	i32 167, ; 335
	i32 39, ; 336
	i32 17, ; 337
	i32 171, ; 338
	i32 137, ; 339
	i32 150, ; 340
	i32 155, ; 341
	i32 130, ; 342
	i32 19, ; 343
	i32 65, ; 344
	i32 147, ; 345
	i32 47, ; 346
	i32 79, ; 347
	i32 61, ; 348
	i32 106, ; 349
	i32 49, ; 350
	i32 14, ; 351
	i32 180, ; 352
	i32 68, ; 353
	i32 171, ; 354
	i32 194, ; 355
	i32 78, ; 356
	i32 108, ; 357
	i32 192, ; 358
	i32 67, ; 359
	i32 63, ; 360
	i32 27, ; 361
	i32 160, ; 362
	i32 191, ; 363
	i32 195, ; 364
	i32 10, ; 365
	i32 11, ; 366
	i32 78, ; 367
	i32 126, ; 368
	i32 83, ; 369
	i32 182, ; 370
	i32 66, ; 371
	i32 107, ; 372
	i32 65, ; 373
	i32 128, ; 374
	i32 122, ; 375
	i32 77, ; 376
	i32 8, ; 377
	i32 196, ; 378
	i32 2, ; 379
	i32 44, ; 380
	i32 200, ; 381
	i32 156, ; 382
	i32 128, ; 383
	i32 23, ; 384
	i32 133, ; 385
	i32 29, ; 386
	i32 62, ; 387
	i32 90, ; 388
	i32 87, ; 389
	i32 148, ; 390
	i32 36, ; 391
	i32 86, ; 392
	i32 179, ; 393
	i32 181, ; 394
	i32 50, ; 395
	i32 6, ; 396
	i32 90, ; 397
	i32 21, ; 398
	i32 162, ; 399
	i32 96, ; 400
	i32 50, ; 401
	i32 113, ; 402
	i32 130, ; 403
	i32 76, ; 404
	i32 27, ; 405
	i32 7, ; 406
	i32 110 ; 407
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 82d8938cf80f6d5fa6c28529ddfbdb753d805ab4"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
