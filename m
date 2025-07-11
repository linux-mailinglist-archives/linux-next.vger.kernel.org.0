Return-Path: <linux-next+bounces-7497-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD7FB0274E
	for <lists+linux-next@lfdr.de>; Sat, 12 Jul 2025 01:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5C7B56486F
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 23:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A5E1F63C1;
	Fri, 11 Jul 2025 23:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="o1mndYIo"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19840EEBD;
	Fri, 11 Jul 2025 23:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752274894; cv=none; b=RL3h233U+RClPcw+qEHnE9bAK1oK6VdVNWyA/TPr15cvTXxZdcgrekhLCcAgdsi70ohVrLRk6x1M4mjsdJxqz6rdyswakNgvRaEL4t0lSUvrNrr+cavR7tIbjD6iYnnbJ/v0FTiM42JOTn0qmIsjf5BvzNd5/MJ6+vSB+ESAYF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752274894; c=relaxed/simple;
	bh=T0R8mMd+TFUa1v+YSwTe+DJt8/Sl5bDyLAy1wjCSOpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NwYBQBvS9FdYCx0uXmymtrwnRTz3YMoEHwjYarzbdgwo8MEb3WZ8VLwfeVVmOUle8CrjiP+jgj8ZGLwdphnAxujkBiXAxJSO/WaJWrzgk7NFgz2Zi8yxmtJCDDIHZGhSy9R9MuiZL5eO3lTysH8TI11FS0FN/PTr308QHCURxzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=o1mndYIo; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1752274848; x=1752879648; i=spasswolf@web.de;
	bh=ay/BgPFW43v/tyIlleQo0fRcj/fTei+y05pJfgd+ZDo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=o1mndYIo6z5JwJGjGcRmdL9jnEWHakakWtRA9nGB1o81KTHx4LJFv1IjH6GjEPyC
	 5096NtJQX1gnOWZpFfgOuBWdl/OIhDH5SYOxNXHsgrHCVxdOKHpEJ/QzjbvazPOYU
	 78sXXP2T2OeV8NbhhIyZgCd2rXsc8aVjFeKJBmfgGmNl0H3p3kkIYZGWjihzhgObZ
	 v6BXGmbdipdx2Z8+rMCYMzn9hTjhmR74uVJmt0UQOlYtCZLYSeZDiPYL/Xg9PY94u
	 yLRkZTLhXUhbag4b67A5ECKhdLw7D00RTrFF6UnO32gShRDMTHSzNaZ6zWjoP4vNf
	 mDlOMQ9i3SYnDLPSDg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from lisa ([95.223.134.88]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mcpuy-1v9yOw0qVm-00lD6G; Sat, 12
 Jul 2025 01:00:48 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Bert Karwatzki <spasswolf@web.de>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	ankur.a.arora@oracle.com,
	bobo.shaobowang@huawei.com,
	boqun.feng@gmail.com,
	frederic@kernel.org,
	joel@joelfernandes.org,
	neeraj.upadhyay@kernel.org,
	paulmck@kernel.org,
	rcu@vger.kernel.org,
	urezki@gmail.com,
	wangxiongfeng2@huawei.com,
	xiexiuqi@huawei.com,
	xiqi2@huawei.com
Subject: commit 3284e4adca9b causes hang on boot with CONFIG_PREEMPT_RT=y
Date: Sat, 12 Jul 2025 01:00:41 +0200
Message-ID: <20250711230042.3468-1-spasswolf@web.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: 58f405af-22a3-4d2e-b06c-d8572b38df40@nvidia.com
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Jc0ibRlDKHQYSN66X3V2yoAA+Mc9gQn+jkm7FpEpioHX/CvrPWC
 iCSzZR4HD0jfpUhHEJIN//eQDyIdTXTyFbIB+E1P3MyD8eTo2FwdRc4F30yAux/SnO4ruEw
 FO6r0K0M/Ya6UCbh3eWzV/P2igu0UrfZvA1t7RY7R212QChd3dhKJA8t18okK+M7SfgVs6o
 OiUWNDcJ/+EEhB1g6PxdA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ir1Lz3kqftw=;3wLybZqNOwrSIKM1PnPY3CtRVZo
 o2IAMECwd9OXnnyeogXHrPXcx4+vThCKHkjz48ZIqAQVgI3LABNW4HTsbOfFzLffTBOYpfnbh
 JkGjpNqRm+Yd44vw3UmpMhBOLFZK1WuqkkOekZgaj7CkLM4NA6Jz6Itlytqg6hu7RoSDCLE7F
 X3p+ZSDSm6jW9cYiM2aCJkY/3j4dov34PeCds/gTJHuNgxZagfPPC8uZip5mQfVRtO62KIf9w
 U+XOBdnBxpnbBqI2iOhnK++dWAmtv2u+QVizqmq08EmciH/wfceHYazejWjWDqgWzHHkLTVLh
 ehNKqxnO/zQV7E7w06+bnA+bpM8OGyg0t5jlZZgc6lcoPd04hy7GsiE1jMYXPDEAI1PaemhOI
 WwZM+YjeYTadLffdJlKOqDpbn+3Bbbo/ePROt0ILAsfZiYvsje84898IgAav7qi4wMbh6K3mB
 hP8hA3Luqy090KVfSETytoun2TQKtDpoZKsgVPO6AI5KMQw9rctB5coZcNtGy0wxA0cZxP3eS
 X+C2Qaf78JChVFD1OSsWk6qCznwFtj0+t9FoiUWn7+QZKba263imRofwVBVRmsSutxrXZwHDY
 nALzMcTz+t/OQ0CNkHt6dXovUb4/vKqJ17TdEE5KTDaYI0eAJyg+aETu2rw7bDuWbftYNy5Nz
 p+QIsY7mTumHqTCJa75C9QOUsvPR3gzIQgAZ/FTdJ1viJX1Tjd6jU8WlIWgXFat/9kv2Tuzt8
 TwOFVp+kl47Ky6ppGfqyJzvB9W3DqxI1aSYufNGEqbsVkuMOeFgkjjQknJfKGkC85CJRdZSm6
 TULhdt+Dt5DzFXxkIWOCOUIgShMHXtZOkb0aC1t2nRf2oIxo3m/Y+pEwXAiR1AEn1uDfTrRFR
 3yekKkAoEhCJZgA2uDpjA4/LvF+MVyref/5YEFMc1wWoCdFsrp8kz32/3J4sQ+3JUgemAhNgu
 pwWDHJdjxzmn5/h2/yr8HFYNZPh/Dsi7/Je7U1Odvmo6tKL1thFhB6BxQWpdYtG236MZHMjj5
 IEf8VgikIRzD1Bs1q+cD/5poe6fK9dlkv+IVDMf2dGexMxlCOID4t+3VinkM28bx+Td7aBV0k
 1PFZbqAGfHhnBPaNBIWCmktvSXLYU92jRnNXPkITLwM60L5n3SV/vuGz9+hHf9NkRCzJ9dqEj
 e3xf90OxapDT3C0J4/0E9dUirN15wrKtOalCeUvDAZhvL9SSciVwEP71vOzEf76lBBERKYluY
 +y/oAKWgioprSfmCKGoi/HGKuEzOhrQlhxxgK65xWQVBrBtUc+HAff4TGEaRtMzXflHwUXnhm
 lUbiU+3XYInSlCQcpY0PO6XE1Jk2Y0DPHS5tZineJSBiqFNv1om1zmdsUK1typw1gnQYzFXID
 hgr19znUWjLBvbfPgd9XO6g62RFZ4oIZbspw8yOC+0Hzs8vcpDUyIXj5uAFBerMQ2vUPlDxQe
 aS9x0ydoRR7+87S6YV96WCfdNsZPqdV7NBxs1Lnczx3jWgoeC33SAKTGlu/79ta5YXjT8+1pm
 r9K2p/qxj/gzMx6ymLO49/YCqTXlaS6H43dP3qh3IROr286ji1olbs7gNOdE7Bv9C5jhGwVh6
 rc8xAwU6j/4o7NjCdG2UviJkfzMSRbi7qaVc63h5g+77339MghQPkzk75C97prnia4vTB+gUS
 U1nIcH2RP4ZBe9ZYJHmhzDf4bX++R2g8nerKm05JW0l7cptVuFlcU4A8gwywpmJJi7DP6A0EM
 96FD3a0YVlfoO2Dr4mc8Cfxzu26AX9PfwJmgPw5MQnzh/KaW13lU8qx01Abc4kBOmrJyx2m29
 sECILz1GuXlPLprnJej1vaLvN1m5rVZ6BMW/4oSRTjM/kJYXW8T3nqlEsr9u0ljp9eaza0o5s
 R4yghaCvJYu/KMSQLoZGMZY2N0XIbAIbghGJ31PBqig1i6Ush9bt9YWqzXnQ2Sp5mjh/krVuw
 VVAGB/xhTQOq2ErbgfNut/NMciVlFDlk0G2EeSy4hvxn2CeklZOJYrFU77Z7mpUC5Iy1IIms/
 1nf5yadXsdLHpyxmJ/QBxrKGb5xMwqotUatyHvKC1sPhYC3iU2U8CM0+qqk/88nbCtF1y67+9
 uTwgy2BXQml4LKAn3ii4hqaej1Ouq2/VoBJ+cFU3Y8iu0bY1l2M6iSbLf+/wHA5foFznekwvv
 y9IEOHUYuXDjwqGoKr5Us09tMSCoAnMX9S8M/jan4c4ltKBrtMOMprUtdMain3cyjjAeIv2Cl
 0s/OMRP6VfdLyqLSk5dOBhM6dzyIcjUNTBCo5TP7DNGIwRL6JLRVvPbDzbqhA97umDtXUV1Xu
 hZXM1x+72vSLp5FVulsrxW0bQiHK4hqgXiIhUak1WyERjNHJyvxvYtUWYqnBg1CR02Ru8siTQ
 JAV0Ya5iHJ7XD67aLJ0yVK2ctZ7RugnU/5zq3Qmgra9AHz+nuNazhE2t7YNYQwbLp13NfJclY
 kwAb8Tsvhj3FbPHacWCwEt5XvGhQmAu9sZiOx2O/FULCfCU9ljOoErVkHE+kjocJlvBcd2aVD
 MKl0hwaZnoKY8nWLQAvpVoIBUidpMSn6HX/9EpjrrOZ++jaG1xH7EBEYTfE/69ZeHfLzkMdmb
 1S/77YvYk1SSKnlA12Ae0+IiAN7fxAPXbdxt9fLIeQ69CJhkcd/91AoDfF5U1TATRH93sAIeU
 UNcWmw3Xlk+X6G0wKuH+py441xYu1wLcVU3YiLZiDmWeGsf9GoBuaINBdXEup27rA3jNmgN44
 AzKGsrjhKjI+XP4hXyFHGTgdrgDkqp6t25yyz8ZhyKsFdOYHTQH4T+0Nqd35gAIbsvKsDjFTm
 AaC48IeVn2Qn2uqFKYykvxssDrr0E3Y6EM4C/nHkQfSJx0IgGYrXMqHrNJ+OcO8zY1fVbyt43
 ZlwbtELgizW4CxpxmA7/f6Tw91enhm0CigKnwK1WqzcTkehhqPi9X6jl7XQiVwc0PuRciNEoe
 fBJdm3ied4OHjceBdZJ43zOPxOCIDQHktPIA8iiikcsDwmxbMzR+BijxCDja8JPJn2XgYl0+j
 /dxESpnNo1V8k1eIERnn2tWEGKVU4CA9xAweRB6q4yW3XXYz2+7vi+sNZn5boYQCLxY3Qjiz2
 ljGkj3gXfqq7amGWcS4drj+vioaa+9dH84CSpUqoaR07Km5Y0B9fYhOmWvRz/cu1CB4AQqo3V
 0xtSokayAzYpAmSu5C1gRcHaPxL8B0uqpq1ol9zyW2H4XdgQvH1po0X0CXeLnZaPf+wDiAp7/
 bqgdvCaXLSq4bWl0nY2wHMmP7mnWl1lRTGCuThcZ0c4pfufHa9xH/hPBOX+1dBwziPL5gXQ1B
 MCr8Q58UVATXQWiVed+0/ljEnvLyF1GGu9S0uPEBWK/6dozIcV6F5Y+vp03icmt61ZI6ziDSV
 qtGUVUVrZ7Y3rZ9Z0I/NRSYTDsH4QS4bJr0ajyj9X7KzuQIzgLBInpdbriSb6b4VVq8bSXejV
 lkB6a6o9NHQ9LzjySWHcO+7wga8S79emJJpnOk4xmus21yB23w5eW26TeqyN5MTwQhA83bI87
 lTQ+XaLPC1Nm3GEj6o48FTk=

When booting linux next-20250711 (with CONFIG_PREEMPT_RT=3Dy) on my MSI Al=
pha 15=20
Laptop running debian sid amd64 the boot process hangs with the last=20
messages displayed on screen being:

fbcon: amdgpudrmfb (fb0) is primary device
Console: switching to colour frame buffer device
amdgpu: 0000:08:00.0: [drm]fb0: admgpudrmfb frame buffer device

after some time (about 60s) this error messages appears (hand copied
from screen, not entirely accurate)

rcu_preempt self detected stall

with call trace
run_irq_workd
smpboot_thread_fn
kthread
? kthreads_online_cpu
? kthreads_online_cpu
ret_from_fork
? kthreads_online_cpu
ret_from_fork

This only occurs when compiling with CONFIG_PREEMPT_RT=3Dy.
I bisected this and found the first bad commit to be

3284e4adca9b ("rcu: Fix rcu_read_unlock() deadloop due to IRQ work")

Reverting this commit in next-20250711 fixes the issue for me.

Hardware:
$ lspci -nn
00:00.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir/Ceza=
nne Root Complex [1022:1630]
00:00.2 IOMMU [0806]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne IO=
MMU [1022:1631]
00:01.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe=
 Dummy Host Bridge [1022:1632]
00:01.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe =
GPP Bridge [1022:1633]
00:02.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe=
 Dummy Host Bridge [1022:1632]
00:02.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezan=
ne PCIe GPP Bridge [1022:1634]
00:02.2 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezan=
ne PCIe GPP Bridge [1022:1634]
00:02.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezan=
ne PCIe GPP Bridge [1022:1634]
00:02.4 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezan=
ne PCIe GPP Bridge [1022:1634]
00:08.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir PCIe=
 Dummy Host Bridge [1022:1632]
00:08.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir Inter=
nal PCIe GPP Bridge to Bus [1022:1635]
00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus Control=
ler [1022:790b] (rev 51)
00:14.3 ISA bridge [0601]: Advanced Micro Devices, Inc. [AMD] FCH LPC Brid=
ge [1022:790e] (rev 51)
00:18.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Dat=
a Fabric; Function 0 [1022:166a]
00:18.1 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Dat=
a Fabric; Function 1 [1022:166b]
00:18.2 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Dat=
a Fabric; Function 2 [1022:166c]
00:18.3 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Dat=
a Fabric; Function 3 [1022:166d]
00:18.4 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Dat=
a Fabric; Function 4 [1022:166e]
00:18.5 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Dat=
a Fabric; Function 5 [1022:166f]
00:18.6 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Dat=
a Fabric; Function 6 [1022:1670]
00:18.7 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne Dat=
a Fabric; Function 7 [1022:1671]
01:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 =
XL Upstream Port of PCI Express Switch [1002:1478] (rev c3)
02:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 =
XL Downstream Port of PCI Express Switch [1002:1479]
03:00.0 Display controller [0380]: Advanced Micro Devices, Inc. [AMD/ATI] =
Navi 23 [Radeon RX 6600/6600 XT/6600M] [1002:73ff] (rev c3)
03:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 2=
1/23 HDMI/DP Audio Controller [1002:ab28]
04:00.0 Network controller [0280]: MEDIATEK Corp. MT7921K (RZ608) Wi-Fi 6E=
 80MHz [14c3:0608]
05:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL811=
1/8168/8211/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev =
15)
06:00.0 Non-Volatile memory controller [0108]: Kingston Technology Company=
, Inc. KC3000/FURY Renegade NVMe SSD [E18] [2646:5013] (rev 01)
07:00.0 Non-Volatile memory controller [0108]: Micron/Crucial Technology P=
1 NVMe PCIe SSD[Frampton] [c0a9:2263] (rev 03)
08:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AM=
D/ATI] Cezanne [Radeon Vega Series / Radeon Vega Mobile Series] [1002:1638=
] (rev c5)
08:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Renoir=
 Radeon High Definition Audio Controller [1002:1637]
08:00.2 Encryption controller [1080]: Advanced Micro Devices, Inc. [AMD] F=
amily 17h (Models 10h-1fh) Platform Security Processor [1022:15df]
08:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Renoir/C=
ezanne USB 3.1 [1022:1639]
08:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Renoir/C=
ezanne USB 3.1 [1022:1639]
08:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc. [AMD] A=
udio Coprocessor [1022:15e2] (rev 01)
08:00.6 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Family 17h=
/19h/1ah HD Audio Controller [1022:15e3]
08:00.7 Signal processing controller [1180]: Advanced Micro Devices, Inc. =
[AMD] Sensor Fusion Hub [1022:15e4]

$ head /proc/cpuinfo=20
processor	: 0
vendor_id	: AuthenticAMD
cpu family	: 25
model		: 80
model name	: AMD Ryzen 7 5800H with Radeon Graphics
stepping	: 0
microcode	: 0xa50000c
cpu MHz		: 2826.830
cache size	: 512 KB
physical id	: 0


Bert Karwatzki

