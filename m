Return-Path: <linux-next+bounces-6732-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 327A5AB4D80
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 10:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCCB41B42835
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 08:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEF71E5B95;
	Tue, 13 May 2025 08:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="lvIZxi/I"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44E8EAC7;
	Tue, 13 May 2025 08:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747123235; cv=none; b=lEQPKpc48xLIVBSFHrhRU/h9INYX21zQ9ZpQsUJiLW/xhbzX+JhBT3T1YaKA8B/PFXZab1NhNKoKh0Rax/E1Q4HCdt9ljjKmIve0Z/0vJX0IJ3x0s4oEfAsF6AukEZrnedjjtEX28FK3LfBRSOFhCXOpXZzYxRQjq4GJLgtbhJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747123235; c=relaxed/simple;
	bh=O4fxmKSZsUfaddlpPK86rx3W5+afzRrx8Jk69dgS6Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pAlLBJ+Cbn9MBtGNM5Or/X4lNdYesLvvFF6J6OudCjlyyh0yGbq32QO7oyDkM0l+2UgBTq6fNsvmiuV/EPIhqZAjS9LLX9L4/w+nfZacC3KE4Kh7i4Jzq53p0dFxAvPYVefX8Z9uXEhFNx6AgqK872zkRmBP/8S/iVMJa3c2MDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=lvIZxi/I; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1747123213; x=1747728013; i=spasswolf@web.de;
	bh=eJg7GacJkymLtmGV6JGhFi8by3ViAUpdLMkZotlaPfE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lvIZxi/I4/Q4ClQLeK5Yst91YocSnIOcP682NYCupcDAZkb7mW/qGARMUVz1dc5+
	 6PLN1UPGPS42kt5nBn9EZPVqWvuP8aIVr5yUX3NuI6fH/VNeqszFE5zcVQqJH4A+O
	 1RWhPf6OVf7bm05fHoU5i0owyeVP73ltdGzizWgh+BamqXWOKVmK/kevvZpb7MKGC
	 WreYdjS9rrv0uXXkU0LVZMm15tBllbRjsFhHJpYXg3g0QOBvtv9aeWm/vGEZVh217
	 Pd9lwE5vN685+7YmuHMg09PKvdwgHX7dW3lXQ9Q70/oDn+a8SMRJRvs7NnzCHKjNW
	 GmsxsckjgSJCEa7XVA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([95.223.134.88]) by smtp.web.de
 (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1N1d3k-1uyhNc42rg-015Jkc; Tue, 13 May 2025 10:00:13 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: linux-kernel@vger.kernel.org
Cc: Bert Karwatzki <spasswolf@web.de>,
	linux-next@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	llvm-bugs@lists.llvm.org
Subject: lockup and kernel panic in linux-next-202505{09,12} when compiled with clang
Date: Tue, 13 May 2025 10:00:10 +0200
Message-ID: <20250513080011.77840-1-spasswolf@web.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8pndVCaHw9gc6hjGQWYb1ZeLTf6AMYXhroD/NZP1eyUzSP3b2Fb
 UMLAdOGxhDEkWafCWIjmsuQll1ipYi6YhFifNT3a6e4qE3ZE9m3Idc7B6lW0h4MsztF1G4+
 w7kC9iWIcpzWWuJwm1DFHzdS1g3wmbPO/vibwhVnBKxohkNdbihG3doKK6gxGN1Qq8JZB0t
 QgJOoA/Yx20yhW8S6HE7Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+cuDpG3BZ0U=;jwF+067Jm+475ReQ3O+kPZG2LfH
 4TVc6FQoDcVnhZtCRclFw5Pk2mM9J6XzfZvUJ9Mj1a8Jv6LAdxg2wZvQ3dJuybYqPmkOL93Si
 URChBk+xUSfwpwdmullYxi3cpd6XwZZEaCCUNySmo79xEmdlyV1+QsbdjtFwnBgrqhxV2D1XM
 wcP8spjwcl4roNahCmYRSiaPnhUN8MlrvLZKwCwT4w2tUOkbNclSLFbxls2oZI1yY/CMsbHm3
 9lMBTVlaZGAT0V4ddGRQR0HXfpDUiIrppLTvlYu3vP94GtuMoHMoQdv1Oy8xhaVkXsPia1soE
 HCYKb4nQWwEtl6E1X6qSf3uFZhPsE83BTQOZr5UtvYGLO2vsoxCIM2N1gJPLppeBMy4vgTiDY
 rbSfpLWcWf8qR4umzv1K4BbANmf+ez4TQh8YW44ZdrcdsVshmPFMcqublEZx2T7iFRAWNwnAw
 ULg/jtZYy7uPQ6kJuas15MkAuKUX7sYJyFu09HuJBd+QYuWZAx59n/EnqPGe4R2bq8BANvaQH
 +NDSylnH6GrktErZ8bVpBSvYvmAcj5G6Es/wLajhHezlyi24xx+/HsoLjESWrtqy2ecWBWq3b
 VxVtRozPEyuOzDwyhK9tTpHqPinQyPZ4yXRrwQyzBk6iGVLA51SCZd5yq+gWqqR5sWvz8jf+E
 XP2BPI+MgxX4mKhoU5FVuGB5ipB1U4gj1UhZ2upitfh/U8CloJRgzKqhgWBVedfCKpSXeTpjH
 SCd7XxutnB2zDcPtpWKupKDEFI8JEQuKMLUclpCymUP129LZAAlroxPmDgPnH87bGYVHW2Oqg
 Y0gHqNHqHfSogI1uWKLnjxcHOiHXmzbzV6w9ax6Hqw7U+xdDCUjN0wonRNHlpgw2jaAY0WjhQ
 myITsaPk5jmftRJpB+yQkcrOZZe7zynngfnbjO74yiN0QULF2t2lksUnp8c8MWp1nWxBshKXP
 8hhWzBa7kycJ0WXlk6d0IHSFK8cPFFdrNoWK5sqmIF3saJG2l3Ze8ijsTUZHr54argPSlbzhH
 GGaotKgYPmj/lLme1wju9uvR/sJvvz2y0R0LWLWwxmBk5BoTZkm50/UNW8QUtOI3HWFrqGJxa
 fmbgL89oCpOgrxXo4AJKxX4iCnBe+kH0XxRaYcDKacZGIjeTv44FlsVfoeAdoVbC7eVrvS+5A
 RHq9zCuMldQ8koKip6yUReAyds3KRmSvbP5eERloSKwwPKJ1XIzy0xmR6Wi+bblj2mH7g5SHq
 N3qAjl0it1ZY08Xt9Z4BkuV2wZKABtSiQ0P86AJMOr6jPhKff674Jqj3fLZj0Aw9t5W9mHOl3
 bo6ez2sfBjp6WwhgDjmR0ofMn3Q6LIXwgDoWcWwNWg2sZsfdynLwFlHjRnY1TdWBBNcqMcXjL
 NmCzVVc5acb4S4Vu567WA2rBzrdZbLjagsyUsJF66FWSK3OlCPnEUOe+U5xVABCQXitSZ5bti
 3CaW6tAbcBRp8SCs26gcPEAIv3yYo7zuTX+tqM9w9IXeNiWrBsRszGgyqmqADtD4w02ZTDndu
 mPBkR4nhnxt7uUwtRUdMwNq/YU2KoNSzzOhITz9HTcYclBQNlIUFCXkuOyDINEiUw6OF//1RX
 1Yah2Zqa7J9G5+ZYkELEFDWeVwbSwtoFernbaaMl0aQJePDx457Jn2wP1HWJRdah0Xz4WtB+U
 Gf/1Ui1WUWLVvfoXruIHvZRjf2dL4SA37YWqdSzWTEEDBtnV0w2vjS659qbgm5UzoOUCpoAk1
 UZARi3h5E9MtZk/kgKvdLbYypV2bfn3gbzhE3zHgm0Jc062FU+vD9ATMmLFW0SBQ++Ufoz6C1
 8Z1jn43u6rZkNffv99WqYEixoykWtvORUoEZYYVVdpd5Wl9K9Hcan885yPs29/x0MqX3LbaZL
 XcX5srfVSNx/iBnaDaeu+LZ7klrrNpMsIX22tjwDD0eRHCLioGlClJYGGozs04NNdMJWyW/Cz
 hQEP4NCulUC0GEM5oS8XGUOtYwKLfsTNXOfzCF/ctRQV/Fq5GF3TulfxCTFeQxCAgdyHrfGRa
 GG2nm/KvXuubs0TMxEG3BCJxfGODhy+pDIvZoQ1ubXrrEf+dzADa3T2g3McNwRFnxU4S7BH+j
 DE4hiPndQA+cTTYsPaFBSLDSJPaexgd1/5W7TVOM5DFmVOmaTr2XXpxXxZ85XZ2qsnNRMtAFY
 qfkeLeyizmOg8DlqKZZ9ULnWCg72AHj/0YfsmqmckGV1/mgnooigXap6DL3s4l0Ipev2hdzze
 7H3bIjsiJQyb1IUYOWDhQ02fr9KZu8uLmlOZWQzYtGVPRAb5qeALFWIjYFfNFbFvIuqLLMi10
 fFUHsJu4tRZt0d5FTPN7UyZl9KlCYOMmEyosNEu5FViVFMO83YodSLrGS8jVMsxCIaWz+iYs2
 tPiINjfQxMoRD601DJryGVrk5wZ2hWyNRYFcsVdMWJf21i9YRMQCkKgzdjzPOZI249ybcaaO+
 ieY6MhO8v8Xsbq+rmIogiOB2gn11WTXaAHRv2osO0QSFyK/p6yZMMLg5mCIyE2DuT0JC8Dzs8
 MIcU6gc0mpzcAGVVcvzm4XvsCnT0iK3eHCym0rnhGkrY2n5oY7IwWdRJe3R2rhEdOpnF03N0R
 YaARCmZSFtA4y4kKPGvEz82k4RIRR0grSQm1hrkg7UCdYofGm1Ua64GHdZia/LximypdF3LU4
 b88E5WX1QX6V3dc5ogl7qFmf7OGm5slzASMTttRYJMXEAnOZ3L+b8ck34SZMwjU/j/mxIV5VB
 C0k0P2K8EXBnY+dOPwQTOkSTS492L855ZO9en6XvhOpS1HSZ815Kjj/Qkoxd8JEn9u645bT9e
 bwxqSk36NaJ5APYrLVISuLLqFAdXcv++KQpVvjNZ5TOiaXXfufhZhTsbubEGhATeZw4FnMHjc
 a33PeWprd3lOCx1BH3ZTVBM/WjxmnAd4HzGYPOnldgiP3+JHqpwtZenHiI1bBd5T9ONmlyWEp
 qE2D1hlXSLdWX1CBK5n2GlDvcXr0x6NXqR9gNklGGRCl6GZ2B9HkVN2G6t8TqWb5o6HpUoM9F
 r8vLA4QdS+oGfyXoEOkASbDPDHZLvxjPkmhTcXs3psoxgJeV0gHKzon79u+CIcmefOCcR1SqW
 px6q9mpi+zYGiUDeqm0SCQOoBnbcFMGRk8G0LgXH3+DMJ7gMJZbrinjJ6CSjS+hJkgDuw0woS
 K+aLc3Q39ddIIU1euvRNtBSDmyjXz6InXPCjP9jWk7Pyb3g==

For testing purposes I compiled linux-next-20250509 with clang from debian =
sid
(the whole system is debian sid running on an MSI Alpha 15 Laptop):

$ clang --version
Debian clang version 19.1.7 (3)
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/lib/llvm-19/bin

This fails to boot and I tried to bisect this between v6.15-rc5 and next-20=
250509.
During this bisection the behaviour of the bad commits was different from n=
ext-20250509:
The system boots to the GUI (xfce from debian sid) but soon after that lock=
s up,
somtimes with flashing capslock indicating a kernel panic. The logs showed =
no
traces of errors. Unfortunately this bisection was inconclusive (i. e. it e=
nded
in a commit which I don't even compile)
 As next-20250512 was released by that time I tested it with clang and the =
error is
present there, too. During the bisection from v6.15-rc6 to next-20250512 I =
was
finally able to get an error message (here there was a lockup without kerne=
l panic,
there are most likely more than one bug):

2025-05-12T22:29:47.022594+02:00 lisa kernel: [  T313] Emergency Sync compl=
ete
2025-05-12T22:29:50.077596+02:00 lisa kernel: [  T245] sysrq: Emergency Sync
2025-05-12T22:29:50.182586+02:00 lisa kernel: [  T313] Emergency Sync compl=
ete
2025-05-12T22:29:52.686659+02:00 lisa kernel: [    C6] watchdog: CPU6: Watc=
hdog detected hard LOCKUP on cpu 6
2025-05-12T22:29:52.686678+02:00 lisa kernel: [    C6] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:29:52.686683+02:00 lisa kernel: [    C6]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:29:52.686686+02:00 lisa kernel: [    C6] CPU: 6 UID: 0 PID: 6=
40 Comm: napi/phy0-0 Not tainted 6.15.0-rc2-bisect-00574-gfe80b0e53d36 #901=
 PREEMPT_{RT,(full)}=20
2025-05-12T22:29:52.686688+02:00 lisa kernel: [    C6] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:29:52.686690+02:00 lisa kernel: [    C6] RIP: 0010:queued_spi=
n_lock_slowpath+0x134/0x1c0
2025-05-12T22:29:52.686693+02:00 lisa kernel: [    C6] Code: 03 c1 e6 04 83=
 e0 fc 49 c7 c0 f8 ff ff ff 49 8b 84 40 50 7a 7d be 48 89 94 06 c0 ed 05 bf=
 83 7a 08 00 75 08 f3 90 83 7a 08 00 <74> f8 48 8b 32 48 85 f6 74 09 0f 0d =
0e eb 0a 31 f6 eb 06 31 f6 eb
2025-05-12T22:29:52.686695+02:00 lisa kernel: [    C6] RSP: 0018:ffffd3bdc1=
e579a0 EFLAGS: 00000046
2025-05-12T22:29:52.686697+02:00 lisa kernel: [    C6] RAX: 000000000032579=
0 RBX: 0000000000000282 RCX: 00000000001c0000
2025-05-12T22:29:52.686699+02:00 lisa kernel: [    C6] RDX: ffff8c456e7a2dc=
0 RSI: 0000000000000010 RDI: ffff8c37bc453fa8
2025-05-12T22:29:52.686701+02:00 lisa kernel: [    C6] RBP: ffff8c36e040c70=
0 R08: fffffffffffffff8 R09: 0000000000000001
2025-05-12T22:29:52.686704+02:00 lisa kernel: [    C6] R10: 000000000000000=
1 R11: ffffffffbdfe74f0 R12: ffff8c37bc453f90
2025-05-12T22:29:52.686706+02:00 lisa kernel: [    C6] R13: ffff8c36c449248=
0 R14: ffff8c37bc453fa8 R15: ffff8c37bc453fa8
2025-05-12T22:29:52.686708+02:00 lisa kernel: [    C6] FS:  000000000000000=
0(0000) GS:ffff8c45af744000(0000) knlGS:0000000000000000
2025-05-12T22:29:52.686711+02:00 lisa kernel: [    C6] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:29:52.686713+02:00 lisa kernel: [    C6] CR2: 00007f92c65a900=
0 CR3: 00000002a9720000 CR4: 0000000000750ef0
2025-05-12T22:29:52.686716+02:00 lisa kernel: [    C6] PKRU: 55555554
2025-05-12T22:29:52.686718+02:00 lisa kernel: [    C6] Call Trace:
2025-05-12T22:29:52.686720+02:00 lisa kernel: [    C6]  <TASK>
2025-05-12T22:29:52.686723+02:00 lisa kernel: [    C6]  _raw_spin_lock_irqs=
ave+0x57/0x60
2025-05-12T22:29:52.686725+02:00 lisa kernel: [    C6]  rt_spin_lock+0x73/0=
xa0
2025-05-12T22:29:52.686727+02:00 lisa kernel: [    C6]  sock_queue_err_skb+=
0xdc/0x140
2025-05-12T22:29:52.686729+02:00 lisa kernel: [    C6]  skb_complete_wifi_a=
ck+0xa9/0x120
2025-05-12T22:29:52.686732+02:00 lisa kernel: [    C6]  ieee80211_report_us=
ed_skb+0x541/0x6e0 [mac80211]
2025-05-12T22:29:52.686734+02:00 lisa kernel: [    C6]  ieee80211_tx_status=
_ext+0x3b9/0x820 [mac80211]
2025-05-12T22:29:52.686736+02:00 lisa kernel: [    C6]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:29:52.686738+02:00 lisa kernel: [    C6]  ? rt_spin_lock+0x3d=
/0xa0
2025-05-12T22:29:52.686741+02:00 lisa kernel: [    C6]  ? mt76_tx_status_un=
lock+0x38/0x230 [mt76]
2025-05-12T22:29:52.686743+02:00 lisa kernel: [    C6]  mt76_tx_status_unlo=
ck+0x1e0/0x230 [mt76]
2025-05-12T22:29:52.686746+02:00 lisa kernel: [    C6]  __mt76_tx_complete_=
skb+0x13b/0x2e0 [mt76]
2025-05-12T22:29:52.686748+02:00 lisa kernel: [    C6]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:29:52.686750+02:00 lisa kernel: [    C6]  ? rt_spin_unlock+0x=
12/0x40
2025-05-12T22:29:52.686753+02:00 lisa kernel: [    C6]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:29:52.686755+02:00 lisa kernel: [    C6]  mt76_connac2_txwi_f=
ree+0x127/0x150 [mt76_connac_lib]
2025-05-12T22:29:52.686757+02:00 lisa kernel: [    C6]  mt7921_mac_tx_free+=
0x112/0x260 [mt7921_common]
2025-05-12T22:29:52.686760+02:00 lisa kernel: [    C6]  mt7921_rx_check+0x3=
3/0xe0 [mt7921_common]
2025-05-12T22:29:52.686762+02:00 lisa kernel: [    C6]  mt76_dma_rx_poll+0x=
322/0x660 [mt76]
2025-05-12T22:29:52.686764+02:00 lisa kernel: [    C6]  ? mt792x_poll_rx+0x=
2a/0x120 [mt792x_lib]
2025-05-12T22:29:52.686766+02:00 lisa kernel: [    C6]  mt792x_poll_rx+0x71=
/0x120 [mt792x_lib]
2025-05-12T22:29:52.686768+02:00 lisa kernel: [    C6]  __napi_poll+0x2a/0x=
170
2025-05-12T22:29:52.686770+02:00 lisa kernel: [    C6]  ? napi_threaded_pol=
l_loop+0x32/0x1b0
2025-05-12T22:29:52.686773+02:00 lisa kernel: [    C6]  napi_threaded_poll_=
loop+0xe4/0x1b0
2025-05-12T22:29:52.686775+02:00 lisa kernel: [    C6]  ? napi_threaded_pol=
l_loop+0x32/0x1b0
2025-05-12T22:29:52.686777+02:00 lisa kernel: [    C6]  ? ttwu_do_activate+=
0xa9/0x1a0
2025-05-12T22:29:52.686779+02:00 lisa kernel: [    C6]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:29:52.686782+02:00 lisa kernel: [    C6]  napi_threaded_poll+=
0x57/0x80
2025-05-12T22:29:52.686784+02:00 lisa kernel: [    C6]  ? __pfx_napi_thread=
ed_poll+0x10/0x10
2025-05-12T22:29:52.686787+02:00 lisa kernel: [    C6]  kthread+0x25c/0x280
2025-05-12T22:29:52.686789+02:00 lisa kernel: [    C6]  ? __pfx_kthread+0x1=
0/0x10
2025-05-12T22:29:52.686792+02:00 lisa kernel: [    C6]  ret_from_fork+0x35/=
0x40
2025-05-12T22:29:52.686794+02:00 lisa kernel: [    C6]  ? __pfx_kthread+0x1=
0/0x10
2025-05-12T22:29:52.686797+02:00 lisa kernel: [    C6]  ret_from_fork_asm+0=
x1a/0x30
2025-05-12T22:29:52.686799+02:00 lisa kernel: [    C6]  </TASK>
2025-05-12T22:29:52.686801+02:00 lisa kernel: [  T245] sysrq: Emergency Sync
2025-05-12T22:29:52.809595+02:00 lisa kernel: [  T313] Emergency Sync compl=
ete
2025-05-12T22:29:54.118600+02:00 lisa kernel: [  T245] sysrq: Emergency Sync
2025-05-12T22:29:54.162590+02:00 lisa kernel: [  T313] Emergency Sync compl=
ete
2025-05-12T22:30:00.545794+02:00 lisa kernel: [   C10] rcu: INFO: rcu_preem=
pt detected stalls on CPUs/tasks:
2025-05-12T22:30:00.545812+02:00 lisa kernel: [   C10] rcu: 	6-...!: (1 GPs=
 behind) idle=3D01fc/1/0x4000000000000000 softirq=3D0/0 fqs=3D112 rcuc=3D21=
006 jiffies(starved)
2025-05-12T22:30:00.545816+02:00 lisa kernel: [   C10] rcu: 	(detected by 1=
0, t=3D21002 jiffies, g=3D104869, q=3D258868 ncpus=3D16)
2025-05-12T22:30:00.545819+02:00 lisa kernel: [   C10] Sending NMI from CPU=
 10 to CPUs 6:
2025-05-12T22:30:00.545822+02:00 lisa kernel: [    C6] NMI backtrace for cp=
u 6
2025-05-12T22:30:00.545824+02:00 lisa kernel: [    C6] CPU: 6 UID: 0 PID: 6=
40 Comm: napi/phy0-0 Not tainted 6.15.0-rc2-bisect-00574-gfe80b0e53d36 #901=
 PREEMPT_{RT,(full)}=20
2025-05-12T22:30:00.545827+02:00 lisa kernel: [    C6] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:30:00.545829+02:00 lisa kernel: [    C6] RIP: 0010:queued_spi=
n_lock_slowpath+0x134/0x1c0
2025-05-12T22:30:00.545832+02:00 lisa kernel: [    C6] Code: 03 c1 e6 04 83=
 e0 fc 49 c7 c0 f8 ff ff ff 49 8b 84 40 50 7a 7d be 48 89 94 06 c0 ed 05 bf=
 83 7a 08 00 75 08 f3 90 83 7a 08 00 <74> f8 48 8b 32 48 85 f6 74 09 0f 0d =
0e eb 0a 31 f6 eb 06 31 f6 eb
2025-05-12T22:30:00.545835+02:00 lisa kernel: [    C6] RSP: 0018:ffffd3bdc1=
e579a0 EFLAGS: 00000046
2025-05-12T22:30:00.545838+02:00 lisa kernel: [    C6] RAX: 000000000032579=
0 RBX: 0000000000000282 RCX: 00000000001c0000
2025-05-12T22:30:00.545840+02:00 lisa kernel: [    C6] RDX: ffff8c456e7a2dc=
0 RSI: 0000000000000010 RDI: ffff8c37bc453fa8
2025-05-12T22:30:00.545842+02:00 lisa kernel: [    C6] RBP: ffff8c36e040c70=
0 R08: fffffffffffffff8 R09: 0000000000000001
2025-05-12T22:30:00.545845+02:00 lisa kernel: [    C6] R10: 000000000000000=
1 R11: ffffffffbdfe74f0 R12: ffff8c37bc453f90
2025-05-12T22:30:00.545847+02:00 lisa kernel: [    C6] R13: ffff8c36c449248=
0 R14: ffff8c37bc453fa8 R15: ffff8c37bc453fa8
2025-05-12T22:30:00.545849+02:00 lisa kernel: [    C6] FS:  000000000000000=
0(0000) GS:ffff8c45af744000(0000) knlGS:0000000000000000
2025-05-12T22:30:00.545851+02:00 lisa kernel: [    C6] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:30:00.545854+02:00 lisa kernel: [    C6] CR2: 00007f92c65a900=
0 CR3: 00000002a9720000 CR4: 0000000000750ef0
2025-05-12T22:30:00.545856+02:00 lisa kernel: [    C6] PKRU: 55555554
2025-05-12T22:30:00.545858+02:00 lisa kernel: [    C6] Call Trace:
2025-05-12T22:30:00.545859+02:00 lisa kernel: [    C6]  <TASK>
2025-05-12T22:30:00.545861+02:00 lisa kernel: [    C6]  _raw_spin_lock_irqs=
ave+0x57/0x60
2025-05-12T22:30:00.545864+02:00 lisa kernel: [    C6]  rt_spin_lock+0x73/0=
xa0
2025-05-12T22:30:00.545866+02:00 lisa kernel: [    C6]  sock_queue_err_skb+=
0xdc/0x140
2025-05-12T22:30:00.545869+02:00 lisa kernel: [    C6]  skb_complete_wifi_a=
ck+0xa9/0x120
2025-05-12T22:30:00.545871+02:00 lisa kernel: [    C6]  ieee80211_report_us=
ed_skb+0x541/0x6e0 [mac80211]
2025-05-12T22:30:00.545873+02:00 lisa kernel: [    C6]  ieee80211_tx_status=
_ext+0x3b9/0x820 [mac80211]
2025-05-12T22:30:00.545876+02:00 lisa kernel: [    C6]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:30:00.545878+02:00 lisa kernel: [    C6]  ? rt_spin_lock+0x3d=
/0xa0
2025-05-12T22:30:00.545880+02:00 lisa kernel: [    C6]  ? mt76_tx_status_un=
lock+0x38/0x230 [mt76]
2025-05-12T22:30:00.545883+02:00 lisa kernel: [    C6]  mt76_tx_status_unlo=
ck+0x1e0/0x230 [mt76]
2025-05-12T22:30:00.545884+02:00 lisa kernel: [    C6]  __mt76_tx_complete_=
skb+0x13b/0x2e0 [mt76]
2025-05-12T22:30:00.545887+02:00 lisa kernel: [    C6]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:30:00.545889+02:00 lisa kernel: [    C6]  ? rt_spin_unlock+0x=
12/0x40
2025-05-12T22:30:00.545891+02:00 lisa kernel: [    C6]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:30:00.545894+02:00 lisa kernel: [    C6]  mt76_connac2_txwi_f=
ree+0x127/0x150 [mt76_connac_lib]
2025-05-12T22:30:00.545896+02:00 lisa kernel: [    C6]  mt7921_mac_tx_free+=
0x112/0x260 [mt7921_common]
2025-05-12T22:30:00.545897+02:00 lisa kernel: [    C6]  mt7921_rx_check+0x3=
3/0xe0 [mt7921_common]
2025-05-12T22:30:00.545900+02:00 lisa kernel: [    C6]  mt76_dma_rx_poll+0x=
322/0x660 [mt76]
2025-05-12T22:30:00.545902+02:00 lisa kernel: [    C6]  ? mt792x_poll_rx+0x=
2a/0x120 [mt792x_lib]
2025-05-12T22:30:00.545905+02:00 lisa kernel: [    C6]  mt792x_poll_rx+0x71=
/0x120 [mt792x_lib]
2025-05-12T22:30:00.545908+02:00 lisa kernel: [    C6]  __napi_poll+0x2a/0x=
170
2025-05-12T22:30:00.545910+02:00 lisa kernel: [    C6]  ? napi_threaded_pol=
l_loop+0x32/0x1b0
2025-05-12T22:30:00.545913+02:00 lisa kernel: [    C6]  napi_threaded_poll_=
loop+0xe4/0x1b0
2025-05-12T22:30:00.545916+02:00 lisa kernel: [    C6]  ? napi_threaded_pol=
l_loop+0x32/0x1b0
2025-05-12T22:30:00.545918+02:00 lisa kernel: [    C6]  ? ttwu_do_activate+=
0xa9/0x1a0
2025-05-12T22:30:00.545920+02:00 lisa kernel: [    C6]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:30:00.545923+02:00 lisa kernel: [    C6]  napi_threaded_poll+=
0x57/0x80
2025-05-12T22:30:00.545926+02:00 lisa kernel: [    C6]  ? __pfx_napi_thread=
ed_poll+0x10/0x10
2025-05-12T22:30:00.545928+02:00 lisa kernel: [    C6]  kthread+0x25c/0x280
2025-05-12T22:30:00.545931+02:00 lisa kernel: [    C6]  ? __pfx_kthread+0x1=
0/0x10
2025-05-12T22:30:00.545933+02:00 lisa kernel: [    C6]  ret_from_fork+0x35/=
0x40
2025-05-12T22:30:00.545935+02:00 lisa kernel: [    C6]  ? __pfx_kthread+0x1=
0/0x10
2025-05-12T22:30:00.545938+02:00 lisa kernel: [    C6]  ret_from_fork_asm+0=
x1a/0x30
2025-05-12T22:30:00.545940+02:00 lisa kernel: [    C6]  </TASK>
2025-05-12T22:30:00.545943+02:00 lisa kernel: [   C10] rcu: rcu_preempt kth=
read starved for 20543 jiffies! g104869 f0x2 RCU_GP_WAIT_FQS(5) ->state=3D0=
x0 ->cpu=3D6
2025-05-12T22:30:00.545945+02:00 lisa kernel: [   C10] rcu: 	Unless rcu_pre=
empt kthread gets sufficient CPU time, OOM is now expected behavior.
2025-05-12T22:30:00.545947+02:00 lisa kernel: [   C10] rcu: RCU grace-perio=
d kthread stack dump:
2025-05-12T22:30:00.545950+02:00 lisa kernel: [   C10] task:rcu_preempt    =
 state:R  running task     stack:0     pid:17    tgid:17    ppid:2      tas=
k_flags:0x208040 flags:0x00004000
2025-05-12T22:30:00.545952+02:00 lisa kernel: [   C10] Call Trace:
2025-05-12T22:30:00.545955+02:00 lisa kernel: [   C10]  <TASK>
2025-05-12T22:30:00.545958+02:00 lisa kernel: [   C10]  __schedule+0x4fe/0x=
1280
2025-05-12T22:30:00.545967+02:00 lisa kernel: [   C10]  ? schedule+0x5f/0xd0
2025-05-12T22:30:00.545969+02:00 lisa kernel: [   C10]  schedule+0x5f/0xd0
2025-05-12T22:30:00.545971+02:00 lisa kernel: [   C10]  schedule_timeout+0x=
76/0xf0
2025-05-12T22:30:00.545973+02:00 lisa kernel: [   C10]  ? __pfx_process_tim=
eout+0x10/0x10
2025-05-12T22:30:00.545975+02:00 lisa kernel: [   C10]  rcu_gp_fqs_loop+0x1=
95/0x740
2025-05-12T22:30:00.545978+02:00 lisa kernel: [   C10]  ? __pfx_rcu_watchin=
g_snap_recheck+0x10/0x10
2025-05-12T22:30:00.545980+02:00 lisa kernel: [   C10]  rcu_gp_kthread+0x21=
/0x180
2025-05-12T22:30:00.545982+02:00 lisa kernel: [   C10]  ? __pfx_rcu_gp_kthr=
ead+0x10/0x10
2025-05-12T22:30:00.545983+02:00 lisa kernel: [   C10]  kthread+0x25c/0x280
2025-05-12T22:30:00.545986+02:00 lisa kernel: [   C10]  ? __pfx_kthread+0x1=
0/0x10
2025-05-12T22:30:00.545988+02:00 lisa kernel: [   C10]  ret_from_fork+0x35/=
0x40
2025-05-12T22:30:00.545990+02:00 lisa kernel: [   C10]  ? __pfx_kthread+0x1=
0/0x10
2025-05-12T22:30:00.545993+02:00 lisa kernel: [   C10]  ret_from_fork_asm+0=
x1a/0x30
2025-05-12T22:30:00.545995+02:00 lisa kernel: [   C10]  </TASK>
2025-05-12T22:30:00.545997+02:00 lisa kernel: [  T245] sysrq: Emergency Sync
2025-05-12T22:30:00.699599+02:00 lisa kernel: [  T313] Emergency Sync compl=
ete
2025-05-12T22:30:01.349584+02:00 lisa kernel: [  T245] sysrq: Emergency Sync
2025-05-12T22:30:01.381591+02:00 lisa kernel: [  T313] Emergency Sync compl=
ete
2025-05-12T22:30:02.469588+02:00 lisa kernel: [  T245] sysrq: Emergency Sync
2025-05-12T22:30:02.508591+02:00 lisa kernel: [  T313] Emergency Sync compl=
ete
2025-05-12T22:30:02.858596+02:00 lisa kernel: [  T245] sysrq: Emergency Sync
2025-05-12T22:30:02.866591+02:00 lisa kernel: [  T313] Emergency Sync compl=
ete
2025-05-12T22:30:03.051589+02:00 lisa kernel: [  T245] sysrq: Emergency Sync
2025-05-12T22:30:03.059588+02:00 lisa kernel: [  T313] Emergency Sync compl=
ete
2025-05-12T22:30:03.264674+02:00 lisa kernel: [   C11] watchdog: BUG: soft =
lockup - CPU#11 stuck for 27s! [cc1:37564]
2025-05-12T22:30:03.264693+02:00 lisa kernel: [   C11] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:30:03.264697+02:00 lisa kernel: [   C11]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:30:03.264699+02:00 lisa kernel: [   C11] CPU: 11 UID: 1000 PI=
D: 37564 Comm: cc1 Not tainted 6.15.0-rc2-bisect-00574-gfe80b0e53d36 #901 P=
REEMPT_{RT,(full)}=20
2025-05-12T22:30:03.264702+02:00 lisa kernel: [   C11] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:30:03.264704+02:00 lisa kernel: [   C11] RIP: 0010:smp_call_f=
unction_many_cond+0x303/0x350
2025-05-12T22:30:03.264707+02:00 lisa kernel: [   C11] Code: bc c8 f7 c1 f0=
 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be f7 44 02 08=
 01 00 00 00 74 bd f3 90 8b 74 10 08 <40> f6 c6 01 75 f4 eb af 65 48 8b 05 =
8d 02 6d 01 48 3b 44 24 38 75
2025-05-12T22:30:03.264709+02:00 lisa kernel: [   C11] RSP: 0018:ffffd3bde2=
15fc40 EFLAGS: 00000202
2025-05-12T22:30:03.264711+02:00 lisa kernel: [   C11] RAX: ffffffffbf063f6=
0 RBX: ffff8c456e8e31c0 RCX: 0000000000000006
2025-05-12T22:30:03.264713+02:00 lisa kernel: [   C11] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c37d053f200
2025-05-12T22:30:03.264716+02:00 lisa kernel: [   C11] RBP: 000000000000000=
3 R08: 0000000000000000 R09: ffffffffffffffff
2025-05-12T22:30:03.264718+02:00 lisa kernel: [   C11] R10: ffff8c45af88400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:30:03.264720+02:00 lisa kernel: [   C11] R13: 000000000000000=
1 R14: 0000000000000202 R15: 0000000000000006
2025-05-12T22:30:03.264722+02:00 lisa kernel: [   C11] FS:  000000000000000=
0(0000) GS:ffff8c45af884000(0000) knlGS:0000000000000000
2025-05-12T22:30:03.264725+02:00 lisa kernel: [   C11] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:30:03.264727+02:00 lisa kernel: [   C11] CR2: 00007f92caf1728=
0 CR3: 0000000b6083c000 CR4: 0000000000750ef0
2025-05-12T22:30:03.264729+02:00 lisa kernel: [   C11] PKRU: 55555554
2025-05-12T22:30:03.264731+02:00 lisa kernel: [   C11] Call Trace:
2025-05-12T22:30:03.264733+02:00 lisa kernel: [   C11]  <TASK>
2025-05-12T22:30:03.264736+02:00 lisa kernel: [   C11]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:30:03.264738+02:00 lisa kernel: [   C11]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:30:03.264740+02:00 lisa kernel: [   C11]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:30:03.264742+02:00 lisa kernel: [   C11]  tlb_flush_mmu+0x79/=
0x1b0
2025-05-12T22:30:03.264744+02:00 lisa kernel: [   C11]  tlb_finish_mmu+0x3f=
/0x80
2025-05-12T22:30:03.264747+02:00 lisa kernel: [   C11]  exit_mmap+0x1cc/0x2=
d0
2025-05-12T22:30:03.264749+02:00 lisa kernel: [   C11]  __mmput+0x26/0xe0
2025-05-12T22:30:03.264752+02:00 lisa kernel: [   C11]  exit_mm+0x94/0xc0
2025-05-12T22:30:03.264754+02:00 lisa kernel: [   C11]  do_exit+0x1f0/0x860
2025-05-12T22:30:03.264756+02:00 lisa kernel: [   C11]  ? rt_spin_lock+0x3d=
/0xa0
2025-05-12T22:30:03.264758+02:00 lisa kernel: [   C11]  do_group_exit+0x96/=
0xa0
2025-05-12T22:30:03.264760+02:00 lisa kernel: [   C11]  __x64_sys_exit_grou=
p+0x12/0x20
2025-05-12T22:30:03.264762+02:00 lisa kernel: [   C11]  x64_sys_call+0x21ba=
/0x21c0
2025-05-12T22:30:03.264764+02:00 lisa kernel: [   C11]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:30:03.264766+02:00 lisa kernel: [   C11]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:30:03.264768+02:00 lisa kernel: [   C11]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:30:03.264770+02:00 lisa kernel: [   C11]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:30:03.264773+02:00 lisa kernel: [   C11] RIP: 0033:0x7f92caf1=
7295
2025-05-12T22:30:03.264775+02:00 lisa kernel: [   C11] Code: Unable to acce=
ss opcode bytes at 0x7f92caf1726b.
2025-05-12T22:30:03.264777+02:00 lisa kernel: [   C11] RSP: 002b:00007ffd99=
8f6ec8 EFLAGS: 00000206 ORIG_RAX: 00000000000000e7
2025-05-12T22:30:03.264780+02:00 lisa kernel: [   C11] RAX: ffffffffffffffd=
a RBX: 00007f92cb022fe8 RCX: 00007f92caf17295
2025-05-12T22:30:03.264782+02:00 lisa kernel: [   C11] RDX: 00000000000000e=
7 RSI: fffffffffffffbf8 RDI: 0000000000000000
2025-05-12T22:30:03.264784+02:00 lisa kernel: [   C11] RBP: 000000000000000=
0 R08: 00007ffd998f6e58 R09: 0000000000000000
2025-05-12T22:30:03.264786+02:00 lisa kernel: [   C11] R10: 00007ffd998f6cf=
0 R11: 0000000000000206 R12: 00007f92cb021680
2025-05-12T22:30:03.264789+02:00 lisa kernel: [   C11] R13: 00007f92cb5bac8=
0 R14: 0000000000000040 R15: 00007f92cb023000
2025-05-12T22:30:03.264791+02:00 lisa kernel: [   C11]  </TASK>
2025-05-12T22:30:03.264793+02:00 lisa kernel: [   C13] watchdog: BUG: soft =
lockup - CPU#13 stuck for 26s! [cc1:37695]
2025-05-12T22:30:03.264796+02:00 lisa kernel: [   C13] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:30:03.264799+02:00 lisa kernel: [   C13]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:30:03.264801+02:00 lisa kernel: [   C13] CPU: 13 UID: 1000 PI=
D: 37695 Comm: cc1 Tainted: G             L      6.15.0-rc2-bisect-00574-gf=
e80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:30:03.264804+02:00 lisa kernel: [   C13] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:30:03.264806+02:00 lisa kernel: [   C13] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:30:03.264808+02:00 lisa kernel: [   C13] RIP: 0010:smp_call_f=
unction_many_cond+0x303/0x350
2025-05-12T22:30:03.264810+02:00 lisa kernel: [   C13] Code: bc c8 f7 c1 f0=
 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be f7 44 02 08=
 01 00 00 00 74 bd f3 90 8b 74 10 08 <40> f6 c6 01 75 f4 eb af 65 48 8b 05 =
8d 02 6d 01 48 3b 44 24 38 75
2025-05-12T22:30:03.264813+02:00 lisa kernel: [   C13] RSP: 0018:ffffd3bde2=
5bfc40 EFLAGS: 00000202
2025-05-12T22:30:03.264815+02:00 lisa kernel: [   C13] RAX: ffffffffbf063f8=
0 RBX: ffff8c456e9631c0 RCX: 0000000000000006
2025-05-12T22:30:03.264817+02:00 lisa kernel: [   C13] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c456e961240
2025-05-12T22:30:03.264820+02:00 lisa kernel: [   C13] RBP: 000000000000000=
3 R08: 0000000000000000 R09: ffffffffffffffff
2025-05-12T22:30:03.264821+02:00 lisa kernel: [   C13] R10: ffff8c45af90400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:30:03.264824+02:00 lisa kernel: [   C13] R13: 000000000000000=
0 R14: 0000000000000202 R15: 0000000000000006
2025-05-12T22:30:03.264826+02:00 lisa kernel: [   C13] FS:  000000000000000=
0(0000) GS:ffff8c45af904000(0000) knlGS:0000000000000000
2025-05-12T22:30:03.264828+02:00 lisa kernel: [   C13] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:30:03.264831+02:00 lisa kernel: [   C13] CR2: 000055c7f775300=
8 CR3: 0000000b6083c000 CR4: 0000000000750ef0
2025-05-12T22:30:03.264833+02:00 lisa kernel: [   C13] PKRU: 55555554
2025-05-12T22:30:03.264835+02:00 lisa kernel: [   C13] Call Trace:
2025-05-12T22:30:03.264837+02:00 lisa kernel: [   C13]  <TASK>
2025-05-12T22:30:03.264840+02:00 lisa kernel: [   C13]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:30:03.264881+02:00 lisa kernel: [   C13]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:30:03.264883+02:00 lisa kernel: [   C13]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:30:03.264885+02:00 lisa kernel: [   C13]  tlb_flush_mmu+0x79/=
0x1b0
2025-05-12T22:30:03.264888+02:00 lisa kernel: [   C13]  tlb_finish_mmu+0x3f=
/0x80
2025-05-12T22:30:03.264890+02:00 lisa kernel: [   C13]  exit_mmap+0x1cc/0x2=
d0
2025-05-12T22:30:03.264893+02:00 lisa kernel: [   C13]  __mmput+0x26/0xe0
2025-05-12T22:30:03.264896+02:00 lisa kernel: [   C13]  exit_mm+0x94/0xc0
2025-05-12T22:30:03.264898+02:00 lisa kernel: [   C13]  do_exit+0x1f0/0x860
2025-05-12T22:30:03.264901+02:00 lisa kernel: [   C13]  ? rt_spin_lock+0x3d=
/0xa0
2025-05-12T22:30:03.264902+02:00 lisa kernel: [   C13]  do_group_exit+0x96/=
0xa0
2025-05-12T22:30:03.264905+02:00 lisa kernel: [   C13]  __x64_sys_exit_grou=
p+0x12/0x20
2025-05-12T22:30:03.264907+02:00 lisa kernel: [   C13]  x64_sys_call+0x21ba=
/0x21c0
2025-05-12T22:30:03.264909+02:00 lisa kernel: [   C13]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:30:03.264912+02:00 lisa kernel: [   C13]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:30:03.264914+02:00 lisa kernel: [   C13]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:30:03.264916+02:00 lisa kernel: [   C13]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:30:03.264918+02:00 lisa kernel: [   C13] RIP: 0033:0x7fd02e53=
8295
2025-05-12T22:30:03.264920+02:00 lisa kernel: [   C13] Code: Unable to acce=
ss opcode bytes at 0x7fd02e53826b.
2025-05-12T22:30:03.264922+02:00 lisa kernel: [   C13] RSP: 002b:00007ffd34=
20ef28 EFLAGS: 00000206 ORIG_RAX: 00000000000000e7
2025-05-12T22:30:03.264925+02:00 lisa kernel: [   C13] RAX: ffffffffffffffd=
a RBX: 00007fd02e643fe8 RCX: 00007fd02e538295
2025-05-12T22:30:03.264927+02:00 lisa kernel: [   C13] RDX: 00000000000000e=
7 RSI: fffffffffffffbf8 RDI: 0000000000000000
2025-05-12T22:30:03.264929+02:00 lisa kernel: [   C13] RBP: 000000000000000=
0 R08: 00007ffd3420eeb8 R09: 0000000000000000
2025-05-12T22:30:03.264932+02:00 lisa kernel: [   C13] R10: 00007ffd3420ed5=
0 R11: 0000000000000206 R12: 00007fd02e642680
2025-05-12T22:30:03.264934+02:00 lisa kernel: [   C13] R13: 00007fd02ebdbc8=
0 R14: 0000000000000040 R15: 00007fd02e644000
2025-05-12T22:30:03.264937+02:00 lisa kernel: [   C13]  </TASK>
2025-05-12T22:30:03.264939+02:00 lisa kernel: [  T245] sysrq: Emergency Sync
2025-05-12T22:30:03.290583+02:00 lisa kernel: [  T313] Emergency Sync compl=
ete
2025-05-12T22:30:04.306586+02:00 lisa kernel: [  T245] sysrq: Emergency Sync
2025-05-12T22:30:04.334586+02:00 lisa kernel: [  T313] Emergency Sync compl=
ete
2025-05-12T22:30:05.136589+02:00 lisa kernel: [  T245] sysrq: Emergency Sync
2025-05-12T22:30:05.164583+02:00 lisa kernel: [  T313] Emergency Sync compl=
ete
2025-05-12T22:31:54.793635+02:00 lisa kernel: [    C3] watchdog: BUG: soft =
lockup - CPU#3 stuck for 22s! [xfsettingsd:1693]
2025-05-12T22:31:54.793649+02:00 lisa kernel: [    C3] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:31:54.793652+02:00 lisa kernel: [    C3]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:31:54.793655+02:00 lisa kernel: [    C3] CPU: 3 UID: 1000 PID=
: 1693 Comm: xfsettingsd Tainted: G             L      6.15.0-rc2-bisect-00=
574-gfe80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:31:54.793657+02:00 lisa kernel: [    C3] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:31:54.793659+02:00 lisa kernel: [    C3] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:31:54.793661+02:00 lisa kernel: [    C3] RIP: 0010:smp_call_f=
unction_many_cond+0x303/0x350
2025-05-12T22:31:54.793662+02:00 lisa kernel: [    C3] Code: bc c8 f7 c1 f0=
 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be f7 44 02 08=
 01 00 00 00 74 bd f3 90 8b 74 10 08 <40> f6 c6 01 75 f4 eb af 65 48 8b 05 =
8d 02 6d 01 48 3b 44 24 38 75
2025-05-12T22:31:54.793664+02:00 lisa kernel: [    C3] RSP: 0018:ffffd3bdc6=
5cfc28 EFLAGS: 00000202
2025-05-12T22:31:54.793665+02:00 lisa kernel: [    C3] RAX: ffffffffbf063ee=
0 RBX: ffff8c456e6e31c0 RCX: 0000000000000006
2025-05-12T22:31:54.793667+02:00 lisa kernel: [    C3] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c456e6e1240
2025-05-12T22:31:54.793669+02:00 lisa kernel: [    C3] RBP: 000000000000000=
3 R08: ffffffffffffffff R09: ffffffffffffffff
2025-05-12T22:31:54.793671+02:00 lisa kernel: [    C3] R10: ffff8c45af68400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:31:54.793673+02:00 lisa kernel: [    C3] R13: 000000000000000=
e R14: 0000000000000202 R15: 0000000000000000
2025-05-12T22:31:54.793674+02:00 lisa kernel: [    C3] FS:  00007f0621c91b0=
0(0000) GS:ffff8c45af684000(0000) knlGS:0000000000000000
2025-05-12T22:31:54.793676+02:00 lisa kernel: [    C3] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:31:54.793678+02:00 lisa kernel: [    C3] CR2: 00000cbd4746a30=
0 CR3: 0000000301556000 CR4: 0000000000750ef0
2025-05-12T22:31:54.793679+02:00 lisa kernel: [    C3] PKRU: 55555554
2025-05-12T22:31:54.793681+02:00 lisa kernel: [    C3] Call Trace:
2025-05-12T22:31:54.793683+02:00 lisa kernel: [    C3]  <TASK>
2025-05-12T22:31:54.793684+02:00 lisa kernel: [    C3]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:31:54.793686+02:00 lisa kernel: [    C3]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:31:54.793688+02:00 lisa kernel: [    C3]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:31:54.793690+02:00 lisa kernel: [    C3]  copy_mm+0x6d2/0x890
2025-05-12T22:31:54.793691+02:00 lisa kernel: [    C3]  copy_process+0x6b5/=
0xf90
2025-05-12T22:31:54.793693+02:00 lisa kernel: [    C3]  kernel_clone+0x94/0=
x2e0
2025-05-12T22:31:54.793695+02:00 lisa kernel: [    C3]  ? rt_spin_lock+0x3d=
/0xa0
2025-05-12T22:31:54.793696+02:00 lisa kernel: [    C3]  __x64_sys_clone+0xc=
3/0xf0
2025-05-12T22:31:54.793698+02:00 lisa kernel: [    C3]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:31:54.793700+02:00 lisa kernel: [    C3]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.793701+02:00 lisa kernel: [    C3]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:31:54.793703+02:00 lisa kernel: [    C3] RIP: 0033:0x7f0622ca=
4202
2025-05-12T22:31:54.793705+02:00 lisa kernel: [    C3] Code: 89 e7 e8 71 3b=
 f6 ff 45 31 c0 31 d2 31 f6 64 48 8b 04 25 10 00 00 00 bf 11 00 20 01 4c 8d=
 90 d0 02 00 00 b8 38 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 5e 89 c5 85 c0 =
75 31 64 48 8b 04 25 10 00 00
2025-05-12T22:31:54.793706+02:00 lisa kernel: [    C3] RSP: 002b:00007ffd09=
1cb4d0 EFLAGS: 00000246 ORIG_RAX: 0000000000000038
2025-05-12T22:31:54.793708+02:00 lisa kernel: [    C3] RAX: ffffffffffffffd=
a RBX: 00007ffd091cb4d0 RCX: 00007f0622ca4202
2025-05-12T22:31:54.793710+02:00 lisa kernel: [    C3] RDX: 000000000000000=
0 RSI: 0000000000000000 RDI: 0000000001200011
2025-05-12T22:31:54.793712+02:00 lisa kernel: [    C3] RBP: 00007ffd091cba2=
0 R08: 0000000000000000 R09: 0000000000000000
2025-05-12T22:31:54.793713+02:00 lisa kernel: [    C3] R10: 00007f0621c91dd=
0 R11: 0000000000000246 R12: 00007ffd091cb500
2025-05-12T22:31:54.793715+02:00 lisa kernel: [    C3] R13: 000000000000000=
0 R14: 0000000000000001 R15: 0000000000000000
2025-05-12T22:31:54.793716+02:00 lisa kernel: [    C3]  </TASK>
2025-05-12T22:31:54.793718+02:00 lisa kernel: [   C12] watchdog: BUG: soft =
lockup - CPU#12 stuck for 22s! [Xorg:1388]
2025-05-12T22:31:54.793720+02:00 lisa kernel: [   C12] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:31:54.793722+02:00 lisa kernel: [   C12]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:31:54.793724+02:00 lisa kernel: [   C12] CPU: 12 UID: 1000 PI=
D: 1388 Comm: Xorg Tainted: G             L      6.15.0-rc2-bisect-00574-gf=
e80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:31:54.793726+02:00 lisa kernel: [   C12] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:31:54.793727+02:00 lisa kernel: [   C12] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:31:54.793729+02:00 lisa kernel: [   C12] RIP: 0010:smp_call_f=
unction_many_cond+0x303/0x350
2025-05-12T22:31:54.793731+02:00 lisa kernel: [   C12] Code: bc c8 f7 c1 f0=
 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be f7 44 02 08=
 01 00 00 00 74 bd f3 90 8b 74 10 08 <40> f6 c6 01 75 f4 eb af 65 48 8b 05 =
8d 02 6d 01 48 3b 44 24 38 75
2025-05-12T22:31:54.793733+02:00 lisa kernel: [   C12] RSP: 0018:ffffd3bdc4=
c07b28 EFLAGS: 00000202
2025-05-12T22:31:54.793735+02:00 lisa kernel: [   C12] RAX: ffffffffbf063e8=
0 RBX: ffff8c456e9231c0 RCX: 0000000000000006
2025-05-12T22:31:54.793736+02:00 lisa kernel: [   C12] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c456e921240
2025-05-12T22:31:54.793738+02:00 lisa kernel: [   C12] RBP: 000000000000000=
3 R08: 0000000000000000 R09: 0000000000200000
2025-05-12T22:31:54.793740+02:00 lisa kernel: [   C12] R10: ffff8c45af8c400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:31:54.793741+02:00 lisa kernel: [   C12] R13: 000000000000000=
0 R14: 0000000000000202 R15: 0000000000000006
2025-05-12T22:31:54.793743+02:00 lisa kernel: [   C12] FS:  00007f460cbc8b0=
0(0000) GS:ffff8c45af8c4000(0000) knlGS:0000000000000000
2025-05-12T22:31:54.793745+02:00 lisa kernel: [   C12] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:31:54.793746+02:00 lisa kernel: [   C12] CR2: 00007f474c7a800=
9 CR3: 0000000108ffa000 CR4: 0000000000750ef0
2025-05-12T22:31:54.793748+02:00 lisa kernel: [   C12] PKRU: 55555554
2025-05-12T22:31:54.793750+02:00 lisa kernel: [   C12] Call Trace:
2025-05-12T22:31:54.793751+02:00 lisa kernel: [   C12]  <TASK>
2025-05-12T22:31:54.793753+02:00 lisa kernel: [   C12]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:31:54.793755+02:00 lisa kernel: [   C12]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:31:54.793757+02:00 lisa kernel: [   C12]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:31:54.793824+02:00 lisa kernel: [   C12]  tlb_flush_mmu+0x79/=
0x1b0
2025-05-12T22:31:54.793826+02:00 lisa kernel: [   C12]  tlb_finish_mmu+0x3f=
/0x80
2025-05-12T22:31:54.793828+02:00 lisa kernel: [   C12]  vms_clear_ptes+0x11=
8/0x150
2025-05-12T22:31:54.793830+02:00 lisa kernel: [   C12]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.793831+02:00 lisa kernel: [   C12]  ? mas_store_gfp+0xe=
0/0x190
2025-05-12T22:31:54.793833+02:00 lisa kernel: [   C12]  vms_complete_munmap=
_vmas+0x78/0x1b0
2025-05-12T22:31:54.793835+02:00 lisa kernel: [   C12]  do_vmi_align_munmap=
+0x251/0x290
2025-05-12T22:31:54.793837+02:00 lisa kernel: [   C12]  ? __pfx_amdgpu_gem_=
va_ioctl+0x10/0x10 [amdgpu]
2025-05-12T22:31:54.793838+02:00 lisa kernel: [   C12]  do_vmi_munmap+0xd6/=
0x100
2025-05-12T22:31:54.793839+02:00 lisa kernel: [   C12]  __vm_munmap+0xcc/0x=
130
2025-05-12T22:31:54.793841+02:00 lisa kernel: [   C12]  __x64_sys_munmap+0x=
16/0x20
2025-05-12T22:31:54.793843+02:00 lisa kernel: [   C12]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:31:54.793845+02:00 lisa kernel: [   C12]  ? __irq_exit_rcu+0x=
6d/0xf0
2025-05-12T22:31:54.793846+02:00 lisa kernel: [   C12]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.793848+02:00 lisa kernel: [   C12]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:31:54.793849+02:00 lisa kernel: [   C12] RIP: 0033:0x7f460cf4=
a6d7
2025-05-12T22:31:54.793851+02:00 lisa kernel: [   C12] Code: 73 01 c3 48 8b=
 0d 21 97 0d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00=
 0f 1f 44 00 00 b8 0b 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d =
f1 96 0d 00 f7 d8 64 89 01 48
2025-05-12T22:31:54.793853+02:00 lisa kernel: [   C12] RSP: 002b:00007fff32=
a17e88 EFLAGS: 00000246 ORIG_RAX: 000000000000000b
2025-05-12T22:31:54.793855+02:00 lisa kernel: [   C12] RAX: ffffffffffffffd=
a RBX: 000055a7ad46a260 RCX: 00007f460cf4a6d7
2025-05-12T22:31:54.793856+02:00 lisa kernel: [   C12] RDX: 000000000000000=
1 RSI: 0000000000200000 RDI: 00007f45a7e00000
2025-05-12T22:31:54.793858+02:00 lisa kernel: [   C12] RBP: 000055a7abb0e24=
0 R08: 0000000000000030 R09: 0000000000000000
2025-05-12T22:31:54.793860+02:00 lisa kernel: [   C12] R10: 000000000000000=
1 R11: 0000000000000246 R12: 000055a7ad46a280
2025-05-12T22:31:54.793862+02:00 lisa kernel: [   C12] R13: 000055a7ad51b63=
0 R14: 000055a7ad210a80 R15: 000055a7abb1a530
2025-05-12T22:31:54.793863+02:00 lisa kernel: [   C12]  </TASK>
2025-05-12T22:31:54.793865+02:00 lisa kernel: [   C10] watchdog: BUG: soft =
lockup - CPU#10 stuck for 45s! [Isolated Web Co:2298]
2025-05-12T22:31:54.793867+02:00 lisa kernel: [   C10] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:31:54.793868+02:00 lisa kernel: [   C10]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:31:54.793870+02:00 lisa kernel: [   C10] CPU: 10 UID: 1000 PI=
D: 2298 Comm: Isolated Web Co Tainted: G             L      6.15.0-rc2-bise=
ct-00574-gfe80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:31:54.793872+02:00 lisa kernel: [   C10] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:31:54.793874+02:00 lisa kernel: [   C10] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:31:54.793875+02:00 lisa kernel: [   C10] RIP: 0010:smp_call_f=
unction_many_cond+0x2ff/0x350
2025-05-12T22:31:54.793877+02:00 lisa kernel: [   C10] Code: 35 f3 48 0f bc=
 c8 f7 c1 f0 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be=
 f7 44 02 08 01 00 00 00 74 bd f3 90 <8b> 74 10 08 40 f6 c6 01 75 f4 eb af =
65 48 8b 05 8d 02 6d 01 48 3b
2025-05-12T22:31:54.793879+02:00 lisa kernel: [   C10] RSP: 0018:ffffd3bdc1=
6af9c8 EFLAGS: 00000202
2025-05-12T22:31:54.793880+02:00 lisa kernel: [   C10] RAX: ffffffffbf063e6=
0 RBX: ffff8c456e8a31c0 RCX: 0000000000000006
2025-05-12T22:31:54.793882+02:00 lisa kernel: [   C10] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c456e8a1240
2025-05-12T22:31:54.793884+02:00 lisa kernel: [   C10] RBP: 000000000000000=
3 R08: ffffffffffffffff R09: ffffffffffffffff
2025-05-12T22:31:54.793885+02:00 lisa kernel: [   C10] R10: ffff8c45af84400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:31:54.793887+02:00 lisa kernel: [   C10] R13: 000000000000000=
1 R14: 0000000000000202 R15: 0000000000000006
2025-05-12T22:31:54.793889+02:00 lisa kernel: [   C10] FS:  00007fd4b176dbc=
0(0000) GS:ffff8c45af844000(0000) knlGS:0000000000000000
2025-05-12T22:31:54.793891+02:00 lisa kernel: [   C10] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:31:54.793893+02:00 lisa kernel: [   C10] CR2: 00007fd48a9dcfe=
0 CR3: 000000021b420000 CR4: 0000000000750ef0
2025-05-12T22:31:54.793894+02:00 lisa kernel: [   C10] PKRU: 55555554
2025-05-12T22:31:54.793896+02:00 lisa kernel: [   C10] Call Trace:
2025-05-12T22:31:54.793898+02:00 lisa kernel: [   C10]  <TASK>
2025-05-12T22:31:54.793899+02:00 lisa kernel: [   C10]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:31:54.793901+02:00 lisa kernel: [   C10]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:31:54.793902+02:00 lisa kernel: [   C10]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:31:54.793904+02:00 lisa kernel: [   C10]  tlb_flush_mmu+0x79/=
0x1b0
2025-05-12T22:31:54.793906+02:00 lisa kernel: [   C10]  tlb_finish_mmu+0x3f=
/0x80
2025-05-12T22:31:54.793908+02:00 lisa kernel: [   C10]  vms_clear_ptes+0x11=
8/0x150
2025-05-12T22:31:54.793909+02:00 lisa kernel: [   C10]  ? vms_gather_munmap=
_vmas+0x210/0x2a0
2025-05-12T22:31:54.793911+02:00 lisa kernel: [   C10]  mmap_region+0x4ae/0=
xc50
2025-05-12T22:31:54.793913+02:00 lisa kernel: [   C10]  do_mmap+0x4ab/0x5e0
2025-05-12T22:31:54.793914+02:00 lisa kernel: [   C10]  vm_mmap_pgoff+0xe6/=
0x190
2025-05-12T22:31:54.793916+02:00 lisa kernel: [   C10]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:31:54.793918+02:00 lisa kernel: [   C10]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.793919+02:00 lisa kernel: [   C10]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.793921+02:00 lisa kernel: [   C10]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:31:54.793923+02:00 lisa kernel: [   C10] RIP: 0033:0x7fd4b18c=
2779
2025-05-12T22:31:54.793924+02:00 lisa kernel: [   C10] Code: ff c3 66 2e 0f=
 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d=
 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d =
4f 86 0d 00 f7 d8 64 89 01 48
2025-05-12T22:31:54.793926+02:00 lisa kernel: [   C10] RSP: 002b:00007fff99=
0a2298 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
2025-05-12T22:31:54.793928+02:00 lisa kernel: [   C10] RAX: ffffffffffffffd=
a RBX: 0000000000500000 RCX: 00007fd4b18c2779
2025-05-12T22:31:54.793929+02:00 lisa kernel: [   C10] RDX: 000000000000000=
0 RSI: 0000000000500000 RDI: 00007fd48f600000
2025-05-12T22:31:54.793931+02:00 lisa kernel: [   C10] RBP: 00007fd4b160210=
0 R08: 00000000ffffffff R09: 0000000000000000
2025-05-12T22:31:54.793933+02:00 lisa kernel: [   C10] R10: 000000000000003=
2 R11: 0000000000000246 R12: 00007fd48f600000
2025-05-12T22:31:54.793934+02:00 lisa kernel: [   C10] R13: 00007fd48a99e00=
0 R14: 0000000000500000 R15: 00007fd48f600000
2025-05-12T22:31:54.793936+02:00 lisa kernel: [   C10]  </TASK>
2025-05-12T22:31:54.793938+02:00 lisa kernel: [   C11] watchdog: BUG: soft =
lockup - CPU#11 stuck for 53s! [cc1:37564]
2025-05-12T22:31:54.793940+02:00 lisa kernel: [   C11] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:31:54.794016+02:00 lisa kernel: [   C11]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:31:54.794018+02:00 lisa kernel: [   C11] CPU: 11 UID: 1000 PI=
D: 37564 Comm: cc1 Tainted: G             L      6.15.0-rc2-bisect-00574-gf=
e80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:31:54.794019+02:00 lisa kernel: [   C11] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:31:54.794021+02:00 lisa kernel: [   C11] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:31:54.794023+02:00 lisa kernel: [   C11] RIP: 0010:smp_call_f=
unction_many_cond+0x303/0x350
2025-05-12T22:31:54.794024+02:00 lisa kernel: [   C11] Code: bc c8 f7 c1 f0=
 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be f7 44 02 08=
 01 00 00 00 74 bd f3 90 8b 74 10 08 <40> f6 c6 01 75 f4 eb af 65 48 8b 05 =
8d 02 6d 01 48 3b 44 24 38 75
2025-05-12T22:31:54.794026+02:00 lisa kernel: [   C11] RSP: 0018:ffffd3bde2=
15fc40 EFLAGS: 00000202
2025-05-12T22:31:54.794028+02:00 lisa kernel: [   C11] RAX: ffffffffbf063f6=
0 RBX: ffff8c456e8e31c0 RCX: 0000000000000006
2025-05-12T22:31:54.794029+02:00 lisa kernel: [   C11] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c37d053f200
2025-05-12T22:31:54.794031+02:00 lisa kernel: [   C11] RBP: 000000000000000=
3 R08: 0000000000000000 R09: ffffffffffffffff
2025-05-12T22:31:54.794033+02:00 lisa kernel: [   C11] R10: ffff8c45af88400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:31:54.794035+02:00 lisa kernel: [   C11] R13: 000000000000000=
1 R14: 0000000000000202 R15: 0000000000000006
2025-05-12T22:31:54.794036+02:00 lisa kernel: [   C11] FS:  000000000000000=
0(0000) GS:ffff8c45af884000(0000) knlGS:0000000000000000
2025-05-12T22:31:54.794038+02:00 lisa kernel: [   C11] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:31:54.794040+02:00 lisa kernel: [   C11] CR2: 00007f92caf1728=
0 CR3: 0000000b6083c000 CR4: 0000000000750ef0
2025-05-12T22:31:54.794041+02:00 lisa kernel: [   C11] PKRU: 55555554
2025-05-12T22:31:54.794043+02:00 lisa kernel: [   C11] Call Trace:
2025-05-12T22:31:54.794045+02:00 lisa kernel: [   C11]  <TASK>
2025-05-12T22:31:54.794046+02:00 lisa kernel: [   C11]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:31:54.794048+02:00 lisa kernel: [   C11]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:31:54.794050+02:00 lisa kernel: [   C11]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:31:54.794051+02:00 lisa kernel: [   C11]  tlb_flush_mmu+0x79/=
0x1b0
2025-05-12T22:31:54.794053+02:00 lisa kernel: [   C11]  tlb_finish_mmu+0x3f=
/0x80
2025-05-12T22:31:54.794055+02:00 lisa kernel: [   C11]  exit_mmap+0x1cc/0x2=
d0
2025-05-12T22:31:54.794057+02:00 lisa kernel: [   C11]  __mmput+0x26/0xe0
2025-05-12T22:31:54.794058+02:00 lisa kernel: [   C11]  exit_mm+0x94/0xc0
2025-05-12T22:31:54.794060+02:00 lisa kernel: [   C11]  do_exit+0x1f0/0x860
2025-05-12T22:31:54.794061+02:00 lisa kernel: [   C11]  ? rt_spin_lock+0x3d=
/0xa0
2025-05-12T22:31:54.794063+02:00 lisa kernel: [   C11]  do_group_exit+0x96/=
0xa0
2025-05-12T22:31:54.794065+02:00 lisa kernel: [   C11]  __x64_sys_exit_grou=
p+0x12/0x20
2025-05-12T22:31:54.794067+02:00 lisa kernel: [   C11]  x64_sys_call+0x21ba=
/0x21c0
2025-05-12T22:31:54.794068+02:00 lisa kernel: [   C11]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:31:54.794070+02:00 lisa kernel: [   C11]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.794072+02:00 lisa kernel: [   C11]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.794073+02:00 lisa kernel: [   C11]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:31:54.794075+02:00 lisa kernel: [   C11] RIP: 0033:0x7f92caf1=
7295
2025-05-12T22:31:54.794077+02:00 lisa kernel: [   C11] Code: Unable to acce=
ss opcode bytes at 0x7f92caf1726b.
2025-05-12T22:31:54.794078+02:00 lisa kernel: [   C11] RSP: 002b:00007ffd99=
8f6ec8 EFLAGS: 00000206 ORIG_RAX: 00000000000000e7
2025-05-12T22:31:54.794080+02:00 lisa kernel: [   C11] RAX: ffffffffffffffd=
a RBX: 00007f92cb022fe8 RCX: 00007f92caf17295
2025-05-12T22:31:54.794082+02:00 lisa kernel: [   C11] RDX: 00000000000000e=
7 RSI: fffffffffffffbf8 RDI: 0000000000000000
2025-05-12T22:31:54.794083+02:00 lisa kernel: [   C11] RBP: 000000000000000=
0 R08: 00007ffd998f6e58 R09: 0000000000000000
2025-05-12T22:31:54.794085+02:00 lisa kernel: [   C11] R10: 00007ffd998f6cf=
0 R11: 0000000000000206 R12: 00007f92cb021680
2025-05-12T22:31:54.794087+02:00 lisa kernel: [   C11] R13: 00007f92cb5bac8=
0 R14: 0000000000000040 R15: 00007f92cb023000
2025-05-12T22:31:54.794089+02:00 lisa kernel: [   C11]  </TASK>
2025-05-12T22:31:54.794090+02:00 lisa kernel: [   C13] watchdog: BUG: soft =
lockup - CPU#13 stuck for 52s! [cc1:37695]
2025-05-12T22:31:54.794092+02:00 lisa kernel: [   C13] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:31:54.794094+02:00 lisa kernel: [   C13]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:31:54.794096+02:00 lisa kernel: [   C13] CPU: 13 UID: 1000 PI=
D: 37695 Comm: cc1 Tainted: G             L      6.15.0-rc2-bisect-00574-gf=
e80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:31:54.794097+02:00 lisa kernel: [   C13] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:31:54.794099+02:00 lisa kernel: [   C13] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:31:54.794101+02:00 lisa kernel: [   C13] RIP: 0010:smp_call_f=
unction_many_cond+0x303/0x350
2025-05-12T22:31:54.794102+02:00 lisa kernel: [   C13] Code: bc c8 f7 c1 f0=
 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be f7 44 02 08=
 01 00 00 00 74 bd f3 90 8b 74 10 08 <40> f6 c6 01 75 f4 eb af 65 48 8b 05 =
8d 02 6d 01 48 3b 44 24 38 75
2025-05-12T22:31:54.794104+02:00 lisa kernel: [   C13] RSP: 0018:ffffd3bde2=
5bfc40 EFLAGS: 00000202
2025-05-12T22:31:54.794106+02:00 lisa kernel: [   C13] RAX: ffffffffbf063f8=
0 RBX: ffff8c456e9631c0 RCX: 0000000000000006
2025-05-12T22:31:54.794108+02:00 lisa kernel: [   C13] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c456e961240
2025-05-12T22:31:54.794109+02:00 lisa kernel: [   C13] RBP: 000000000000000=
3 R08: 0000000000000000 R09: ffffffffffffffff
2025-05-12T22:31:54.794111+02:00 lisa kernel: [   C13] R10: ffff8c45af90400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:31:54.794113+02:00 lisa kernel: [   C13] R13: 000000000000000=
0 R14: 0000000000000202 R15: 0000000000000006
2025-05-12T22:31:54.794114+02:00 lisa kernel: [   C13] FS:  000000000000000=
0(0000) GS:ffff8c45af904000(0000) knlGS:0000000000000000
2025-05-12T22:31:54.794116+02:00 lisa kernel: [   C13] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:31:54.794117+02:00 lisa kernel: [   C13] CR2: 000055c7f775300=
8 CR3: 0000000b6083c000 CR4: 0000000000750ef0
2025-05-12T22:31:54.794119+02:00 lisa kernel: [   C13] PKRU: 55555554
2025-05-12T22:31:54.794121+02:00 lisa kernel: [   C13] Call Trace:
2025-05-12T22:31:54.794122+02:00 lisa kernel: [   C13]  <TASK>
2025-05-12T22:31:54.794124+02:00 lisa kernel: [   C13]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:31:54.794126+02:00 lisa kernel: [   C13]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:31:54.794128+02:00 lisa kernel: [   C13]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:31:54.794129+02:00 lisa kernel: [   C13]  tlb_flush_mmu+0x79/=
0x1b0
2025-05-12T22:31:54.794131+02:00 lisa kernel: [   C13]  tlb_finish_mmu+0x3f=
/0x80
2025-05-12T22:31:54.794132+02:00 lisa kernel: [   C13]  exit_mmap+0x1cc/0x2=
d0
2025-05-12T22:31:54.794134+02:00 lisa kernel: [   C13]  __mmput+0x26/0xe0
2025-05-12T22:31:54.794136+02:00 lisa kernel: [   C13]  exit_mm+0x94/0xc0
2025-05-12T22:31:54.794138+02:00 lisa kernel: [   C13]  do_exit+0x1f0/0x860
2025-05-12T22:31:54.794139+02:00 lisa kernel: [   C13]  ? rt_spin_lock+0x3d=
/0xa0
2025-05-12T22:31:54.794141+02:00 lisa kernel: [   C13]  do_group_exit+0x96/=
0xa0
2025-05-12T22:31:54.794143+02:00 lisa kernel: [   C13]  __x64_sys_exit_grou=
p+0x12/0x20
2025-05-12T22:31:54.794144+02:00 lisa kernel: [   C13]  x64_sys_call+0x21ba=
/0x21c0
2025-05-12T22:31:54.794146+02:00 lisa kernel: [   C13]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:31:54.794148+02:00 lisa kernel: [   C13]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.794149+02:00 lisa kernel: [   C13]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.794151+02:00 lisa kernel: [   C13]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:31:54.794152+02:00 lisa kernel: [   C13] RIP: 0033:0x7fd02e53=
8295
2025-05-12T22:31:54.794154+02:00 lisa kernel: [   C13] Code: Unable to acce=
ss opcode bytes at 0x7fd02e53826b.
2025-05-12T22:31:54.794156+02:00 lisa kernel: [   C13] RSP: 002b:00007ffd34=
20ef28 EFLAGS: 00000206 ORIG_RAX: 00000000000000e7
2025-05-12T22:31:54.794213+02:00 lisa kernel: [   C13] RAX: ffffffffffffffd=
a RBX: 00007fd02e643fe8 RCX: 00007fd02e538295
2025-05-12T22:31:54.794215+02:00 lisa kernel: [   C13] RDX: 00000000000000e=
7 RSI: fffffffffffffbf8 RDI: 0000000000000000
2025-05-12T22:31:54.794217+02:00 lisa kernel: [   C13] RBP: 000000000000000=
0 R08: 00007ffd3420eeb8 R09: 0000000000000000
2025-05-12T22:31:54.794218+02:00 lisa kernel: [   C13] R10: 00007ffd3420ed5=
0 R11: 0000000000000206 R12: 00007fd02e642680
2025-05-12T22:31:54.794220+02:00 lisa kernel: [   C13] R13: 00007fd02ebdbc8=
0 R14: 0000000000000040 R15: 00007fd02e644000
2025-05-12T22:31:54.794222+02:00 lisa kernel: [   C13]  </TASK>
2025-05-12T22:31:54.794224+02:00 lisa kernel: [    C3] watchdog: BUG: soft =
lockup - CPU#3 stuck for 48s! [xfsettingsd:1693]
2025-05-12T22:31:54.794225+02:00 lisa kernel: [    C3] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:31:54.794227+02:00 lisa kernel: [    C3]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:31:54.794229+02:00 lisa kernel: [    C3] CPU: 3 UID: 1000 PID=
: 1693 Comm: xfsettingsd Tainted: G             L      6.15.0-rc2-bisect-00=
574-gfe80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:31:54.794230+02:00 lisa kernel: [    C3] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:31:54.794232+02:00 lisa kernel: [    C3] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:31:54.794234+02:00 lisa kernel: [    C3] RIP: 0010:smp_call_f=
unction_many_cond+0x303/0x350
2025-05-12T22:31:54.794243+02:00 lisa kernel: [    C3] Code: bc c8 f7 c1 f0=
 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be f7 44 02 08=
 01 00 00 00 74 bd f3 90 8b 74 10 08 <40> f6 c6 01 75 f4 eb af 65 48 8b 05 =
8d 02 6d 01 48 3b 44 24 38 75
2025-05-12T22:31:54.794245+02:00 lisa kernel: [    C3] RSP: 0018:ffffd3bdc6=
5cfc28 EFLAGS: 00000202
2025-05-12T22:31:54.794247+02:00 lisa kernel: [    C3] RAX: ffffffffbf063ee=
0 RBX: ffff8c456e6e31c0 RCX: 0000000000000006
2025-05-12T22:31:54.794248+02:00 lisa kernel: [    C3] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c456e6e1240
2025-05-12T22:31:54.794250+02:00 lisa kernel: [    C3] RBP: 000000000000000=
3 R08: ffffffffffffffff R09: ffffffffffffffff
2025-05-12T22:31:54.794251+02:00 lisa kernel: [    C3] R10: ffff8c45af68400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:31:54.794256+02:00 lisa kernel: [    C3] R13: 000000000000000=
e R14: 0000000000000202 R15: 0000000000000000
2025-05-12T22:31:54.794258+02:00 lisa kernel: [    C3] FS:  00007f0621c91b0=
0(0000) GS:ffff8c45af684000(0000) knlGS:0000000000000000
2025-05-12T22:31:54.794260+02:00 lisa kernel: [    C3] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:31:54.794261+02:00 lisa kernel: [    C3] CR2: 00000cbd4746a30=
0 CR3: 0000000301556000 CR4: 0000000000750ef0
2025-05-12T22:31:54.794263+02:00 lisa kernel: [    C3] PKRU: 55555554
2025-05-12T22:31:54.794265+02:00 lisa kernel: [    C3] Call Trace:
2025-05-12T22:31:54.794268+02:00 lisa kernel: [    C3]  <TASK>
2025-05-12T22:31:54.794270+02:00 lisa kernel: [    C3]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:31:54.794272+02:00 lisa kernel: [    C3]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:31:54.794274+02:00 lisa kernel: [    C3]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:31:54.794275+02:00 lisa kernel: [    C3]  copy_mm+0x6d2/0x890
2025-05-12T22:31:54.794277+02:00 lisa kernel: [    C3]  copy_process+0x6b5/=
0xf90
2025-05-12T22:31:54.794278+02:00 lisa kernel: [    C3]  kernel_clone+0x94/0=
x2e0
2025-05-12T22:31:54.794283+02:00 lisa kernel: [    C3]  ? rt_spin_lock+0x3d=
/0xa0
2025-05-12T22:31:54.794284+02:00 lisa kernel: [    C3]  __x64_sys_clone+0xc=
3/0xf0
2025-05-12T22:31:54.794286+02:00 lisa kernel: [    C3]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:31:54.794287+02:00 lisa kernel: [    C3]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.794289+02:00 lisa kernel: [    C3]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:31:54.794291+02:00 lisa kernel: [    C3] RIP: 0033:0x7f0622ca=
4202
2025-05-12T22:31:54.794299+02:00 lisa kernel: [    C3] Code: 89 e7 e8 71 3b=
 f6 ff 45 31 c0 31 d2 31 f6 64 48 8b 04 25 10 00 00 00 bf 11 00 20 01 4c 8d=
 90 d0 02 00 00 b8 38 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 5e 89 c5 85 c0 =
75 31 64 48 8b 04 25 10 00 00
2025-05-12T22:31:54.794301+02:00 lisa kernel: [    C3] RSP: 002b:00007ffd09=
1cb4d0 EFLAGS: 00000246 ORIG_RAX: 0000000000000038
2025-05-12T22:31:54.794303+02:00 lisa kernel: [    C3] RAX: ffffffffffffffd=
a RBX: 00007ffd091cb4d0 RCX: 00007f0622ca4202
2025-05-12T22:31:54.794305+02:00 lisa kernel: [    C3] RDX: 000000000000000=
0 RSI: 0000000000000000 RDI: 0000000001200011
2025-05-12T22:31:54.794306+02:00 lisa kernel: [    C3] RBP: 00007ffd091cba2=
0 R08: 0000000000000000 R09: 0000000000000000
2025-05-12T22:31:54.794308+02:00 lisa kernel: [    C3] R10: 00007f0621c91dd=
0 R11: 0000000000000246 R12: 00007ffd091cb500
2025-05-12T22:31:54.794314+02:00 lisa kernel: [    C3] R13: 000000000000000=
0 R14: 0000000000000001 R15: 0000000000000000
2025-05-12T22:31:54.794316+02:00 lisa kernel: [    C3]  </TASK>
2025-05-12T22:31:54.794317+02:00 lisa kernel: [   C12] watchdog: BUG: soft =
lockup - CPU#12 stuck for 49s! [Xorg:1388]
2025-05-12T22:31:54.794319+02:00 lisa kernel: [   C12] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:31:54.794321+02:00 lisa kernel: [   C12]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:31:54.794326+02:00 lisa kernel: [   C12] CPU: 12 UID: 1000 PI=
D: 1388 Comm: Xorg Tainted: G             L      6.15.0-rc2-bisect-00574-gf=
e80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:31:54.794328+02:00 lisa kernel: [   C12] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:31:54.794329+02:00 lisa kernel: [   C12] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:31:54.794331+02:00 lisa kernel: [   C12] RIP: 0010:smp_call_f=
unction_many_cond+0x303/0x350
2025-05-12T22:31:54.794333+02:00 lisa kernel: [   C12] Code: bc c8 f7 c1 f0=
 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be f7 44 02 08=
 01 00 00 00 74 bd f3 90 8b 74 10 08 <40> f6 c6 01 75 f4 eb af 65 48 8b 05 =
8d 02 6d 01 48 3b 44 24 38 75
2025-05-12T22:31:54.794338+02:00 lisa kernel: [   C12] RSP: 0018:ffffd3bdc4=
c07b28 EFLAGS: 00000202
2025-05-12T22:31:54.794340+02:00 lisa kernel: [   C12] RAX: ffffffffbf063e8=
0 RBX: ffff8c456e9231c0 RCX: 0000000000000006
2025-05-12T22:31:54.794342+02:00 lisa kernel: [   C12] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c456e921240
2025-05-12T22:31:54.794343+02:00 lisa kernel: [   C12] RBP: 000000000000000=
3 R08: 0000000000000000 R09: 0000000000200000
2025-05-12T22:31:54.794345+02:00 lisa kernel: [   C12] R10: ffff8c45af8c400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:31:54.794347+02:00 lisa kernel: [   C12] R13: 000000000000000=
0 R14: 0000000000000202 R15: 0000000000000006
2025-05-12T22:31:54.794421+02:00 lisa kernel: [   C12] FS:  00007f460cbc8b0=
0(0000) GS:ffff8c45af8c4000(0000) knlGS:0000000000000000
2025-05-12T22:31:54.794423+02:00 lisa kernel: [   C12] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:31:54.794425+02:00 lisa kernel: [   C12] CR2: 00007f474c7a800=
9 CR3: 0000000108ffa000 CR4: 0000000000750ef0
2025-05-12T22:31:54.794426+02:00 lisa kernel: [   C12] PKRU: 55555554
2025-05-12T22:31:54.794428+02:00 lisa kernel: [   C12] Call Trace:
2025-05-12T22:31:54.794430+02:00 lisa kernel: [   C12]  <TASK>
2025-05-12T22:31:54.794435+02:00 lisa kernel: [   C12]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:31:54.794437+02:00 lisa kernel: [   C12]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:31:54.794438+02:00 lisa kernel: [   C12]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:31:54.794440+02:00 lisa kernel: [   C12]  tlb_flush_mmu+0x79/=
0x1b0
2025-05-12T22:31:54.794442+02:00 lisa kernel: [   C12]  tlb_finish_mmu+0x3f=
/0x80
2025-05-12T22:31:54.794443+02:00 lisa kernel: [   C12]  vms_clear_ptes+0x11=
8/0x150
2025-05-12T22:31:54.794445+02:00 lisa kernel: [   C12]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.794451+02:00 lisa kernel: [   C12]  ? mas_store_gfp+0xe=
0/0x190
2025-05-12T22:31:54.794452+02:00 lisa kernel: [   C12]  vms_complete_munmap=
_vmas+0x78/0x1b0
2025-05-12T22:31:54.794454+02:00 lisa kernel: [   C12]  do_vmi_align_munmap=
+0x251/0x290
2025-05-12T22:31:54.794456+02:00 lisa kernel: [   C12]  ? __pfx_amdgpu_gem_=
va_ioctl+0x10/0x10 [amdgpu]
2025-05-12T22:31:54.794458+02:00 lisa kernel: [   C12]  do_vmi_munmap+0xd6/=
0x100
2025-05-12T22:31:54.794459+02:00 lisa kernel: [   C12]  __vm_munmap+0xcc/0x=
130
2025-05-12T22:31:54.794465+02:00 lisa kernel: [   C12]  __x64_sys_munmap+0x=
16/0x20
2025-05-12T22:31:54.794467+02:00 lisa kernel: [   C12]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:31:54.794469+02:00 lisa kernel: [   C12]  ? __irq_exit_rcu+0x=
6d/0xf0
2025-05-12T22:31:54.794470+02:00 lisa kernel: [   C12]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.794472+02:00 lisa kernel: [   C12]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:31:54.794473+02:00 lisa kernel: [   C12] RIP: 0033:0x7f460cf4=
a6d7
2025-05-12T22:31:54.794475+02:00 lisa kernel: [   C12] Code: 73 01 c3 48 8b=
 0d 21 97 0d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00=
 0f 1f 44 00 00 b8 0b 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d =
f1 96 0d 00 f7 d8 64 89 01 48
2025-05-12T22:31:54.794481+02:00 lisa kernel: [   C12] RSP: 002b:00007fff32=
a17e88 EFLAGS: 00000246 ORIG_RAX: 000000000000000b
2025-05-12T22:31:54.794482+02:00 lisa kernel: [   C12] RAX: ffffffffffffffd=
a RBX: 000055a7ad46a260 RCX: 00007f460cf4a6d7
2025-05-12T22:31:54.794484+02:00 lisa kernel: [   C12] RDX: 000000000000000=
1 RSI: 0000000000200000 RDI: 00007f45a7e00000
2025-05-12T22:31:54.794486+02:00 lisa kernel: [   C12] RBP: 000055a7abb0e24=
0 R08: 0000000000000030 R09: 0000000000000000
2025-05-12T22:31:54.794487+02:00 lisa kernel: [   C12] R10: 000000000000000=
1 R11: 0000000000000246 R12: 000055a7ad46a280
2025-05-12T22:31:54.794489+02:00 lisa kernel: [   C12] R13: 000055a7ad51b63=
0 R14: 000055a7ad210a80 R15: 000055a7abb1a530
2025-05-12T22:31:54.794495+02:00 lisa kernel: [   C12]  </TASK>
2025-05-12T22:31:54.794497+02:00 lisa kernel: [   C10] watchdog: BUG: soft =
lockup - CPU#10 stuck for 71s! [Isolated Web Co:2298]
2025-05-12T22:31:54.794499+02:00 lisa kernel: [   C10] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:31:54.794501+02:00 lisa kernel: [   C10]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:31:54.794506+02:00 lisa kernel: [   C10] CPU: 10 UID: 1000 PI=
D: 2298 Comm: Isolated Web Co Tainted: G             L      6.15.0-rc2-bise=
ct-00574-gfe80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:31:54.794507+02:00 lisa kernel: [   C10] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:31:54.794509+02:00 lisa kernel: [   C10] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:31:54.794511+02:00 lisa kernel: [   C10] RIP: 0010:smp_call_f=
unction_many_cond+0x303/0x350
2025-05-12T22:31:54.794512+02:00 lisa kernel: [   C10] Code: bc c8 f7 c1 f0=
 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be f7 44 02 08=
 01 00 00 00 74 bd f3 90 8b 74 10 08 <40> f6 c6 01 75 f4 eb af 65 48 8b 05 =
8d 02 6d 01 48 3b 44 24 38 75
2025-05-12T22:31:54.794518+02:00 lisa kernel: [   C10] RSP: 0018:ffffd3bdc1=
6af9c8 EFLAGS: 00000202
2025-05-12T22:31:54.794520+02:00 lisa kernel: [   C10] RAX: ffffffffbf063e6=
0 RBX: ffff8c456e8a31c0 RCX: 0000000000000006
2025-05-12T22:31:54.794522+02:00 lisa kernel: [   C10] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c456e8a1240
2025-05-12T22:31:54.794523+02:00 lisa kernel: [   C10] RBP: 000000000000000=
3 R08: ffffffffffffffff R09: ffffffffffffffff
2025-05-12T22:31:54.794525+02:00 lisa kernel: [   C10] R10: ffff8c45af84400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:31:54.794526+02:00 lisa kernel: [   C10] R13: 000000000000000=
1 R14: 0000000000000202 R15: 0000000000000006
2025-05-12T22:31:54.794528+02:00 lisa kernel: [   C10] FS:  00007fd4b176dbc=
0(0000) GS:ffff8c45af844000(0000) knlGS:0000000000000000
2025-05-12T22:31:54.794534+02:00 lisa kernel: [   C10] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:31:54.794535+02:00 lisa kernel: [   C10] CR2: 00007fd48a9dcfe=
0 CR3: 000000021b420000 CR4: 0000000000750ef0
2025-05-12T22:31:54.794537+02:00 lisa kernel: [   C10] PKRU: 55555554
2025-05-12T22:31:54.794539+02:00 lisa kernel: [   C10] Call Trace:
2025-05-12T22:31:54.794549+02:00 lisa kernel: [   C10]  <TASK>
2025-05-12T22:31:54.794552+02:00 lisa kernel: [   C10]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:31:54.794558+02:00 lisa kernel: [   C10]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:31:54.794560+02:00 lisa kernel: [   C10]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:31:54.794562+02:00 lisa kernel: [   C10]  tlb_flush_mmu+0x79/=
0x1b0
2025-05-12T22:31:54.794563+02:00 lisa kernel: [   C10]  tlb_finish_mmu+0x3f=
/0x80
2025-05-12T22:31:54.794565+02:00 lisa kernel: [   C10]  vms_clear_ptes+0x11=
8/0x150
2025-05-12T22:31:54.794566+02:00 lisa kernel: [   C10]  ? vms_gather_munmap=
_vmas+0x210/0x2a0
2025-05-12T22:31:54.794572+02:00 lisa kernel: [   C10]  mmap_region+0x4ae/0=
xc50
2025-05-12T22:31:54.794573+02:00 lisa kernel: [   C10]  do_mmap+0x4ab/0x5e0
2025-05-12T22:31:54.794575+02:00 lisa kernel: [   C10]  vm_mmap_pgoff+0xe6/=
0x190
2025-05-12T22:31:54.794577+02:00 lisa kernel: [   C10]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:31:54.794579+02:00 lisa kernel: [   C10]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.794580+02:00 lisa kernel: [   C10]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.794582+02:00 lisa kernel: [   C10]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:31:54.794587+02:00 lisa kernel: [   C10] RIP: 0033:0x7fd4b18c=
2779
2025-05-12T22:31:54.794589+02:00 lisa kernel: [   C10] Code: ff c3 66 2e 0f=
 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d=
 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d =
4f 86 0d 00 f7 d8 64 89 01 48
2025-05-12T22:31:54.794591+02:00 lisa kernel: [   C10] RSP: 002b:00007fff99=
0a2298 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
2025-05-12T22:31:54.794592+02:00 lisa kernel: [   C10] RAX: ffffffffffffffd=
a RBX: 0000000000500000 RCX: 00007fd4b18c2779
2025-05-12T22:31:54.794594+02:00 lisa kernel: [   C10] RDX: 000000000000000=
0 RSI: 0000000000500000 RDI: 00007fd48f600000
2025-05-12T22:31:54.794596+02:00 lisa kernel: [   C10] RBP: 00007fd4b160210=
0 R08: 00000000ffffffff R09: 0000000000000000
2025-05-12T22:31:54.794601+02:00 lisa kernel: [   C10] R10: 000000000000003=
2 R11: 0000000000000246 R12: 00007fd48f600000
2025-05-12T22:31:54.794603+02:00 lisa kernel: [   C10] R13: 00007fd48a99e00=
0 R14: 0000000000500000 R15: 00007fd48f600000
2025-05-12T22:31:54.794604+02:00 lisa kernel: [   C10]  </TASK>
2025-05-12T22:31:54.794606+02:00 lisa kernel: [   C11] watchdog: BUG: soft =
lockup - CPU#11 stuck for 79s! [cc1:37564]
2025-05-12T22:31:54.794670+02:00 lisa kernel: [   C11] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:31:54.794675+02:00 lisa kernel: [   C11]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:31:54.794677+02:00 lisa kernel: [   C11] CPU: 11 UID: 1000 PI=
D: 37564 Comm: cc1 Tainted: G             L      6.15.0-rc2-bisect-00574-gf=
e80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:31:54.794679+02:00 lisa kernel: [   C11] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:31:54.794680+02:00 lisa kernel: [   C11] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:31:54.794682+02:00 lisa kernel: [   C11] RIP: 0010:smp_call_f=
unction_many_cond+0x303/0x350
2025-05-12T22:31:54.794687+02:00 lisa kernel: [   C11] Code: bc c8 f7 c1 f0=
 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be f7 44 02 08=
 01 00 00 00 74 bd f3 90 8b 74 10 08 <40> f6 c6 01 75 f4 eb af 65 48 8b 05 =
8d 02 6d 01 48 3b 44 24 38 75
2025-05-12T22:31:54.794689+02:00 lisa kernel: [   C11] RSP: 0018:ffffd3bde2=
15fc40 EFLAGS: 00000202
2025-05-12T22:31:54.794691+02:00 lisa kernel: [   C11] RAX: ffffffffbf063f6=
0 RBX: ffff8c456e8e31c0 RCX: 0000000000000006
2025-05-12T22:31:54.794693+02:00 lisa kernel: [   C11] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c37d053f200
2025-05-12T22:31:54.794694+02:00 lisa kernel: [   C11] RBP: 000000000000000=
3 R08: 0000000000000000 R09: ffffffffffffffff
2025-05-12T22:31:54.794696+02:00 lisa kernel: [   C11] R10: ffff8c45af88400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:31:54.794701+02:00 lisa kernel: [   C11] R13: 000000000000000=
1 R14: 0000000000000202 R15: 0000000000000006
2025-05-12T22:31:54.794703+02:00 lisa kernel: [   C11] FS:  000000000000000=
0(0000) GS:ffff8c45af884000(0000) knlGS:0000000000000000
2025-05-12T22:31:54.794705+02:00 lisa kernel: [   C11] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:31:54.794706+02:00 lisa kernel: [   C11] CR2: 00007f92caf1728=
0 CR3: 0000000b6083c000 CR4: 0000000000750ef0
2025-05-12T22:31:54.794708+02:00 lisa kernel: [   C11] PKRU: 55555554
2025-05-12T22:31:54.794710+02:00 lisa kernel: [   C11] Call Trace:
2025-05-12T22:31:54.794715+02:00 lisa kernel: [   C11]  <TASK>
2025-05-12T22:31:54.794717+02:00 lisa kernel: [   C11]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:31:54.794719+02:00 lisa kernel: [   C11]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:31:54.794720+02:00 lisa kernel: [   C11]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:31:54.794722+02:00 lisa kernel: [   C11]  tlb_flush_mmu+0x79/=
0x1b0
2025-05-12T22:31:54.794724+02:00 lisa kernel: [   C11]  tlb_finish_mmu+0x3f=
/0x80
2025-05-12T22:31:54.794725+02:00 lisa kernel: [   C11]  exit_mmap+0x1cc/0x2=
d0
2025-05-12T22:31:54.794731+02:00 lisa kernel: [   C11]  __mmput+0x26/0xe0
2025-05-12T22:31:54.794732+02:00 lisa kernel: [   C11]  exit_mm+0x94/0xc0
2025-05-12T22:31:54.794734+02:00 lisa kernel: [   C11]  do_exit+0x1f0/0x860
2025-05-12T22:31:54.794736+02:00 lisa kernel: [   C11]  ? rt_spin_lock+0x3d=
/0xa0
2025-05-12T22:31:54.794737+02:00 lisa kernel: [   C11]  do_group_exit+0x96/=
0xa0
2025-05-12T22:31:54.794739+02:00 lisa kernel: [   C11]  __x64_sys_exit_grou=
p+0x12/0x20
2025-05-12T22:31:54.794744+02:00 lisa kernel: [   C11]  x64_sys_call+0x21ba=
/0x21c0
2025-05-12T22:31:54.794746+02:00 lisa kernel: [   C11]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:31:54.794748+02:00 lisa kernel: [   C11]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.794750+02:00 lisa kernel: [   C11]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.794751+02:00 lisa kernel: [   C11]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:31:54.794753+02:00 lisa kernel: [   C11] RIP: 0033:0x7f92caf1=
7295
2025-05-12T22:31:54.794758+02:00 lisa kernel: [   C11] Code: Unable to acce=
ss opcode bytes at 0x7f92caf1726b.
2025-05-12T22:31:54.794763+02:00 lisa kernel: [   C11] RSP: 002b:00007ffd99=
8f6ec8 EFLAGS: 00000206 ORIG_RAX: 00000000000000e7
2025-05-12T22:31:54.794765+02:00 lisa kernel: [   C11] RAX: ffffffffffffffd=
a RBX: 00007f92cb022fe8 RCX: 00007f92caf17295
2025-05-12T22:31:54.794767+02:00 lisa kernel: [   C11] RDX: 00000000000000e=
7 RSI: fffffffffffffbf8 RDI: 0000000000000000
2025-05-12T22:31:54.794768+02:00 lisa kernel: [   C11] RBP: 000000000000000=
0 R08: 00007ffd998f6e58 R09: 0000000000000000
2025-05-12T22:31:54.794770+02:00 lisa kernel: [   C11] R10: 00007ffd998f6cf=
0 R11: 0000000000000206 R12: 00007f92cb021680
2025-05-12T22:31:54.794771+02:00 lisa kernel: [   C11] R13: 00007f92cb5bac8=
0 R14: 0000000000000040 R15: 00007f92cb023000
2025-05-12T22:31:54.794778+02:00 lisa kernel: [   C11]  </TASK>
2025-05-12T22:31:54.794780+02:00 lisa kernel: [   C13] watchdog: BUG: soft =
lockup - CPU#13 stuck for 78s! [cc1:37695]
2025-05-12T22:31:54.794781+02:00 lisa kernel: [   C13] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:31:54.794783+02:00 lisa kernel: [   C13]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:31:54.794792+02:00 lisa kernel: [   C13] CPU: 13 UID: 1000 PI=
D: 37695 Comm: cc1 Tainted: G             L      6.15.0-rc2-bisect-00574-gf=
e80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:31:54.794793+02:00 lisa kernel: [   C13] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:31:54.794795+02:00 lisa kernel: [   C13] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:31:54.794797+02:00 lisa kernel: [   C13] RIP: 0010:smp_call_f=
unction_many_cond+0x303/0x350
2025-05-12T22:31:54.794799+02:00 lisa kernel: [   C13] Code: bc c8 f7 c1 f0=
 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be f7 44 02 08=
 01 00 00 00 74 bd f3 90 8b 74 10 08 <40> f6 c6 01 75 f4 eb af 65 48 8b 05 =
8d 02 6d 01 48 3b 44 24 38 75
2025-05-12T22:31:54.794804+02:00 lisa kernel: [   C13] RSP: 0018:ffffd3bde2=
5bfc40 EFLAGS: 00000202
2025-05-12T22:31:54.794806+02:00 lisa kernel: [   C13] RAX: ffffffffbf063f8=
0 RBX: ffff8c456e9631c0 RCX: 0000000000000006
2025-05-12T22:31:54.794808+02:00 lisa kernel: [   C13] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c456e961240
2025-05-12T22:31:54.794810+02:00 lisa kernel: [   C13] RBP: 000000000000000=
3 R08: 0000000000000000 R09: ffffffffffffffff
2025-05-12T22:31:54.794811+02:00 lisa kernel: [   C13] R10: ffff8c45af90400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:31:54.794813+02:00 lisa kernel: [   C13] R13: 000000000000000=
0 R14: 0000000000000202 R15: 0000000000000006
2025-05-12T22:31:54.794814+02:00 lisa kernel: [   C13] FS:  000000000000000=
0(0000) GS:ffff8c45af904000(0000) knlGS:0000000000000000
2025-05-12T22:31:54.794820+02:00 lisa kernel: [   C13] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:31:54.794822+02:00 lisa kernel: [   C13] CR2: 000055c7f775300=
8 CR3: 0000000b6083c000 CR4: 0000000000750ef0
2025-05-12T22:31:54.794823+02:00 lisa kernel: [   C13] PKRU: 55555554
2025-05-12T22:31:54.794825+02:00 lisa kernel: [   C13] Call Trace:
2025-05-12T22:31:54.794826+02:00 lisa kernel: [   C13]  <TASK>
2025-05-12T22:31:54.794828+02:00 lisa kernel: [   C13]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:31:54.794834+02:00 lisa kernel: [   C13]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:31:54.794924+02:00 lisa kernel: [   C13]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:31:54.794926+02:00 lisa kernel: [   C13]  tlb_flush_mmu+0x79/=
0x1b0
2025-05-12T22:31:54.794928+02:00 lisa kernel: [   C13]  tlb_finish_mmu+0x3f=
/0x80
2025-05-12T22:31:54.794930+02:00 lisa kernel: [   C13]  exit_mmap+0x1cc/0x2=
d0
2025-05-12T22:31:54.794931+02:00 lisa kernel: [   C13]  __mmput+0x26/0xe0
2025-05-12T22:31:54.794933+02:00 lisa kernel: [   C13]  exit_mm+0x94/0xc0
2025-05-12T22:31:54.794939+02:00 lisa kernel: [   C13]  do_exit+0x1f0/0x860
2025-05-12T22:31:54.794941+02:00 lisa kernel: [   C13]  ? rt_spin_lock+0x3d=
/0xa0
2025-05-12T22:31:54.794943+02:00 lisa kernel: [   C13]  do_group_exit+0x96/=
0xa0
2025-05-12T22:31:54.794944+02:00 lisa kernel: [   C13]  __x64_sys_exit_grou=
p+0x12/0x20
2025-05-12T22:31:54.794946+02:00 lisa kernel: [   C13]  x64_sys_call+0x21ba=
/0x21c0
2025-05-12T22:31:54.794948+02:00 lisa kernel: [   C13]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:31:54.794953+02:00 lisa kernel: [   C13]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.794955+02:00 lisa kernel: [   C13]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.794956+02:00 lisa kernel: [   C13]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:31:54.794958+02:00 lisa kernel: [   C13] RIP: 0033:0x7fd02e53=
8295
2025-05-12T22:31:54.794959+02:00 lisa kernel: [   C13] Code: Unable to acce=
ss opcode bytes at 0x7fd02e53826b.
2025-05-12T22:31:54.794961+02:00 lisa kernel: [   C13] RSP: 002b:00007ffd34=
20ef28 EFLAGS: 00000206 ORIG_RAX: 00000000000000e7
2025-05-12T22:31:54.794967+02:00 lisa kernel: [   C13] RAX: ffffffffffffffd=
a RBX: 00007fd02e643fe8 RCX: 00007fd02e538295
2025-05-12T22:31:54.794969+02:00 lisa kernel: [   C13] RDX: 00000000000000e=
7 RSI: fffffffffffffbf8 RDI: 0000000000000000
2025-05-12T22:31:54.794970+02:00 lisa kernel: [   C13] RBP: 000000000000000=
0 R08: 00007ffd3420eeb8 R09: 0000000000000000
2025-05-12T22:31:54.794972+02:00 lisa kernel: [   C13] R10: 00007ffd3420ed5=
0 R11: 0000000000000206 R12: 00007fd02e642680
2025-05-12T22:31:54.794974+02:00 lisa kernel: [   C13] R13: 00007fd02ebdbc8=
0 R14: 0000000000000040 R15: 00007fd02e644000
2025-05-12T22:31:54.794975+02:00 lisa kernel: [   C13]  </TASK>
2025-05-12T22:31:54.794977+02:00 lisa kernel: [   C12] rcu: INFO: rcu_preem=
pt detected stalls on CPUs/tasks:
2025-05-12T22:31:54.794982+02:00 lisa kernel: [   C12] rcu: 	6-...!: (1 GPs=
 behind) idle=3D01fc/1/0x4000000000000000 softirq=3D0/0 fqs=3D112 rcuc=3D84=
012 jiffies(starved)
2025-05-12T22:31:54.794984+02:00 lisa kernel: [   C12] rcu: 	(detected by 1=
2, t=3D84008 jiffies, g=3D104869, q=3D872446 ncpus=3D16)
2025-05-12T22:31:54.794986+02:00 lisa kernel: [   C12] Sending NMI from CPU=
 12 to CPUs 6:
2025-05-12T22:31:54.794987+02:00 lisa kernel: [    C6] NMI backtrace for cp=
u 6
2025-05-12T22:31:54.794989+02:00 lisa kernel: [    C6] CPU: 6 UID: 0 PID: 6=
40 Comm: napi/phy0-0 Tainted: G             L      6.15.0-rc2-bisect-00574-=
gfe80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:31:54.794990+02:00 lisa kernel: [    C6] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:31:54.794996+02:00 lisa kernel: [    C6] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:31:54.794998+02:00 lisa kernel: [    C6] RIP: 0010:queued_spi=
n_lock_slowpath+0x134/0x1c0
2025-05-12T22:31:54.795000+02:00 lisa kernel: [    C6] Code: 03 c1 e6 04 83=
 e0 fc 49 c7 c0 f8 ff ff ff 49 8b 84 40 50 7a 7d be 48 89 94 06 c0 ed 05 bf=
 83 7a 08 00 75 08 f3 90 83 7a 08 00 <74> f8 48 8b 32 48 85 f6 74 09 0f 0d =
0e eb 0a 31 f6 eb 06 31 f6 eb
2025-05-12T22:31:54.795001+02:00 lisa kernel: [    C6] RSP: 0018:ffffd3bdc1=
e579a0 EFLAGS: 00000046
2025-05-12T22:31:54.795003+02:00 lisa kernel: [    C6] RAX: 000000000032579=
0 RBX: 0000000000000282 RCX: 00000000001c0000
2025-05-12T22:31:54.795004+02:00 lisa kernel: [    C6] RDX: ffff8c456e7a2dc=
0 RSI: 0000000000000010 RDI: ffff8c37bc453fa8
2025-05-12T22:31:54.795010+02:00 lisa kernel: [    C6] RBP: ffff8c36e040c70=
0 R08: fffffffffffffff8 R09: 0000000000000001
2025-05-12T22:31:54.795012+02:00 lisa kernel: [    C6] R10: 000000000000000=
1 R11: ffffffffbdfe74f0 R12: ffff8c37bc453f90
2025-05-12T22:31:54.795013+02:00 lisa kernel: [    C6] R13: ffff8c36c449248=
0 R14: ffff8c37bc453fa8 R15: ffff8c37bc453fa8
2025-05-12T22:31:54.795015+02:00 lisa kernel: [    C6] FS:  000000000000000=
0(0000) GS:ffff8c45af744000(0000) knlGS:0000000000000000
2025-05-12T22:31:54.795016+02:00 lisa kernel: [    C6] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:31:54.795018+02:00 lisa kernel: [    C6] CR2: 00007f92c65a900=
0 CR3: 00000002a9720000 CR4: 0000000000750ef0
2025-05-12T22:31:54.795023+02:00 lisa kernel: [    C6] PKRU: 55555554
2025-05-12T22:31:54.795025+02:00 lisa kernel: [    C6] Call Trace:
2025-05-12T22:31:54.795027+02:00 lisa kernel: [    C6]  <TASK>
2025-05-12T22:31:54.795029+02:00 lisa kernel: [    C6]  _raw_spin_lock_irqs=
ave+0x57/0x60
2025-05-12T22:31:54.795030+02:00 lisa kernel: [    C6]  rt_spin_lock+0x73/0=
xa0
2025-05-12T22:31:54.795032+02:00 lisa kernel: [    C6]  sock_queue_err_skb+=
0xdc/0x140
2025-05-12T22:31:54.795037+02:00 lisa kernel: [    C6]  skb_complete_wifi_a=
ck+0xa9/0x120
2025-05-12T22:31:54.795039+02:00 lisa kernel: [    C6]  ieee80211_report_us=
ed_skb+0x541/0x6e0 [mac80211]
2025-05-12T22:31:54.795041+02:00 lisa kernel: [    C6]  ieee80211_tx_status=
_ext+0x3b9/0x820 [mac80211]
2025-05-12T22:31:54.795042+02:00 lisa kernel: [    C6]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.795044+02:00 lisa kernel: [    C6]  ? rt_spin_lock+0x3d=
/0xa0
2025-05-12T22:31:54.795046+02:00 lisa kernel: [    C6]  ? mt76_tx_status_un=
lock+0x38/0x230 [mt76]
2025-05-12T22:31:54.795047+02:00 lisa kernel: [    C6]  mt76_tx_status_unlo=
ck+0x1e0/0x230 [mt76]
2025-05-12T22:31:54.795053+02:00 lisa kernel: [    C6]  __mt76_tx_complete_=
skb+0x13b/0x2e0 [mt76]
2025-05-12T22:31:54.795054+02:00 lisa kernel: [    C6]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.795056+02:00 lisa kernel: [    C6]  ? rt_spin_unlock+0x=
12/0x40
2025-05-12T22:31:54.795058+02:00 lisa kernel: [    C6]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.795060+02:00 lisa kernel: [    C6]  mt76_connac2_txwi_f=
ree+0x127/0x150 [mt76_connac_lib]
2025-05-12T22:31:54.795061+02:00 lisa kernel: [    C6]  mt7921_mac_tx_free+=
0x112/0x260 [mt7921_common]
2025-05-12T22:31:54.795067+02:00 lisa kernel: [    C6]  mt7921_rx_check+0x3=
3/0xe0 [mt7921_common]
2025-05-12T22:31:54.795069+02:00 lisa kernel: [    C6]  mt76_dma_rx_poll+0x=
322/0x660 [mt76]
2025-05-12T22:31:54.795071+02:00 lisa kernel: [    C6]  ? mt792x_poll_rx+0x=
2a/0x120 [mt792x_lib]
2025-05-12T22:31:54.795072+02:00 lisa kernel: [    C6]  mt792x_poll_rx+0x71=
/0x120 [mt792x_lib]
2025-05-12T22:31:54.795074+02:00 lisa kernel: [    C6]  __napi_poll+0x2a/0x=
170
2025-05-12T22:31:54.795075+02:00 lisa kernel: [    C6]  ? napi_threaded_pol=
l_loop+0x32/0x1b0
2025-05-12T22:31:54.795077+02:00 lisa kernel: [    C6]  napi_threaded_poll_=
loop+0xe4/0x1b0
2025-05-12T22:31:54.795083+02:00 lisa kernel: [    C6]  ? napi_threaded_pol=
l_loop+0x32/0x1b0
2025-05-12T22:31:54.795084+02:00 lisa kernel: [    C6]  ? ttwu_do_activate+=
0xa9/0x1a0
2025-05-12T22:31:54.795086+02:00 lisa kernel: [    C6]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.795087+02:00 lisa kernel: [    C6]  napi_threaded_poll+=
0x57/0x80
2025-05-12T22:31:54.795089+02:00 lisa kernel: [    C6]  ? __pfx_napi_thread=
ed_poll+0x10/0x10
2025-05-12T22:31:54.795091+02:00 lisa kernel: [    C6]  kthread+0x25c/0x280
2025-05-12T22:31:54.795096+02:00 lisa kernel: [    C6]  ? __pfx_kthread+0x1=
0/0x10
2025-05-12T22:31:54.795098+02:00 lisa kernel: [    C6]  ret_from_fork+0x35/=
0x40
2025-05-12T22:31:54.795099+02:00 lisa kernel: [    C6]  ? __pfx_kthread+0x1=
0/0x10
2025-05-12T22:31:54.795101+02:00 lisa kernel: [    C6]  ret_from_fork_asm+0=
x1a/0x30
2025-05-12T22:31:54.795103+02:00 lisa kernel: [    C6]  </TASK>
2025-05-12T22:31:54.795105+02:00 lisa kernel: [   C12] rcu: rcu_preempt kth=
read starved for 83549 jiffies! g104869 f0x2 RCU_GP_WAIT_FQS(5) ->state=3D0=
x0 ->cpu=3D6
2025-05-12T22:31:54.795110+02:00 lisa kernel: [   C12] rcu: 	Unless rcu_pre=
empt kthread gets sufficient CPU time, OOM is now expected behavior.
2025-05-12T22:31:54.795112+02:00 lisa kernel: [   C12] rcu: RCU grace-perio=
d kthread stack dump:
2025-05-12T22:31:54.795113+02:00 lisa kernel: [   C12] task:rcu_preempt    =
 state:R  running task     stack:0     pid:17    tgid:17    ppid:2      tas=
k_flags:0x208040 flags:0x00004000
2025-05-12T22:31:54.795115+02:00 lisa kernel: [   C12] Call Trace:
2025-05-12T22:31:54.795117+02:00 lisa kernel: [   C12]  <TASK>
2025-05-12T22:31:54.795118+02:00 lisa kernel: [   C12]  __schedule+0x4fe/0x=
1280
2025-05-12T22:31:54.795124+02:00 lisa kernel: [   C12]  ? schedule+0x5f/0xd0
2025-05-12T22:31:54.795125+02:00 lisa kernel: [   C12]  schedule+0x5f/0xd0
2025-05-12T22:31:54.795127+02:00 lisa kernel: [   C12]  schedule_timeout+0x=
76/0xf0
2025-05-12T22:31:54.795129+02:00 lisa kernel: [   C12]  ? __pfx_process_tim=
eout+0x10/0x10
2025-05-12T22:31:54.795131+02:00 lisa kernel: [   C12]  rcu_gp_fqs_loop+0x1=
95/0x740
2025-05-12T22:31:54.795132+02:00 lisa kernel: [   C12]  ? __pfx_rcu_watchin=
g_snap_recheck+0x10/0x10
2025-05-12T22:31:54.795134+02:00 lisa kernel: [   C12]  rcu_gp_kthread+0x21=
/0x180
2025-05-12T22:31:54.795139+02:00 lisa kernel: [   C12]  ? __pfx_rcu_gp_kthr=
ead+0x10/0x10
2025-05-12T22:31:54.795141+02:00 lisa kernel: [   C12]  kthread+0x25c/0x280
2025-05-12T22:31:54.795142+02:00 lisa kernel: [   C12]  ? __pfx_kthread+0x1=
0/0x10
2025-05-12T22:31:54.795144+02:00 lisa kernel: [   C12]  ret_from_fork+0x35/=
0x40
2025-05-12T22:31:54.795146+02:00 lisa kernel: [   C12]  ? __pfx_kthread+0x1=
0/0x10
2025-05-12T22:31:54.795147+02:00 lisa kernel: [   C12]  ret_from_fork_asm+0=
x1a/0x30
2025-05-12T22:31:54.795153+02:00 lisa kernel: [   C12]  </TASK>
2025-05-12T22:31:54.795154+02:00 lisa kernel: [    C3] watchdog: BUG: soft =
lockup - CPU#3 stuck for 74s! [xfsettingsd:1693]
2025-05-12T22:31:54.795156+02:00 lisa kernel: [    C3] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:31:54.795225+02:00 lisa kernel: [    C3]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:31:54.795231+02:00 lisa kernel: [    C3] CPU: 3 UID: 1000 PID=
: 1693 Comm: xfsettingsd Tainted: G             L      6.15.0-rc2-bisect-00=
574-gfe80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:31:54.795233+02:00 lisa kernel: [    C3] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:31:54.795235+02:00 lisa kernel: [    C3] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:31:54.795237+02:00 lisa kernel: [    C3] RIP: 0010:smp_call_f=
unction_many_cond+0x303/0x350
2025-05-12T22:31:54.795238+02:00 lisa kernel: [    C3] Code: bc c8 f7 c1 f0=
 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be f7 44 02 08=
 01 00 00 00 74 bd f3 90 8b 74 10 08 <40> f6 c6 01 75 f4 eb af 65 48 8b 05 =
8d 02 6d 01 48 3b 44 24 38 75
2025-05-12T22:31:54.795240+02:00 lisa kernel: [    C3] RSP: 0018:ffffd3bdc6=
5cfc28 EFLAGS: 00000202
2025-05-12T22:31:54.795245+02:00 lisa kernel: [    C3] RAX: ffffffffbf063ee=
0 RBX: ffff8c456e6e31c0 RCX: 0000000000000006
2025-05-12T22:31:54.795247+02:00 lisa kernel: [    C3] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c456e6e1240
2025-05-12T22:31:54.795249+02:00 lisa kernel: [    C3] RBP: 000000000000000=
3 R08: ffffffffffffffff R09: ffffffffffffffff
2025-05-12T22:31:54.795251+02:00 lisa kernel: [    C3] R10: ffff8c45af68400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:31:54.795252+02:00 lisa kernel: [    C3] R13: 000000000000000=
e R14: 0000000000000202 R15: 0000000000000000
2025-05-12T22:31:54.795254+02:00 lisa kernel: [    C3] FS:  00007f0621c91b0=
0(0000) GS:ffff8c45af684000(0000) knlGS:0000000000000000
2025-05-12T22:31:54.795259+02:00 lisa kernel: [    C3] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:31:54.795261+02:00 lisa kernel: [    C3] CR2: 00000cbd4746a30=
0 CR3: 0000000301556000 CR4: 0000000000750ef0
2025-05-12T22:31:54.795262+02:00 lisa kernel: [    C3] PKRU: 55555554
2025-05-12T22:31:54.795264+02:00 lisa kernel: [    C3] Call Trace:
2025-05-12T22:31:54.795266+02:00 lisa kernel: [    C3]  <TASK>
2025-05-12T22:31:54.795267+02:00 lisa kernel: [    C3]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:31:54.795273+02:00 lisa kernel: [    C3]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:31:54.795275+02:00 lisa kernel: [    C3]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:31:54.795276+02:00 lisa kernel: [    C3]  copy_mm+0x6d2/0x890
2025-05-12T22:31:54.795278+02:00 lisa kernel: [    C3]  copy_process+0x6b5/=
0xf90
2025-05-12T22:31:54.795280+02:00 lisa kernel: [    C3]  kernel_clone+0x94/0=
x2e0
2025-05-12T22:31:54.795282+02:00 lisa kernel: [    C3]  ? rt_spin_lock+0x3d=
/0xa0
2025-05-12T22:31:54.795283+02:00 lisa kernel: [    C3]  __x64_sys_clone+0xc=
3/0xf0
2025-05-12T22:31:54.795288+02:00 lisa kernel: [    C3]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:31:54.795290+02:00 lisa kernel: [    C3]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.795292+02:00 lisa kernel: [    C3]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:31:54.795293+02:00 lisa kernel: [    C3] RIP: 0033:0x7f0622ca=
4202
2025-05-12T22:31:54.795295+02:00 lisa kernel: [    C3] Code: 89 e7 e8 71 3b=
 f6 ff 45 31 c0 31 d2 31 f6 64 48 8b 04 25 10 00 00 00 bf 11 00 20 01 4c 8d=
 90 d0 02 00 00 b8 38 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 5e 89 c5 85 c0 =
75 31 64 48 8b 04 25 10 00 00
2025-05-12T22:31:54.795297+02:00 lisa kernel: [    C3] RSP: 002b:00007ffd09=
1cb4d0 EFLAGS: 00000246 ORIG_RAX: 0000000000000038
2025-05-12T22:31:54.795302+02:00 lisa kernel: [    C3] RAX: ffffffffffffffd=
a RBX: 00007ffd091cb4d0 RCX: 00007f0622ca4202
2025-05-12T22:31:54.795304+02:00 lisa kernel: [    C3] RDX: 000000000000000=
0 RSI: 0000000000000000 RDI: 0000000001200011
2025-05-12T22:31:54.795306+02:00 lisa kernel: [    C3] RBP: 00007ffd091cba2=
0 R08: 0000000000000000 R09: 0000000000000000
2025-05-12T22:31:54.795307+02:00 lisa kernel: [    C3] R10: 00007f0621c91dd=
0 R11: 0000000000000246 R12: 00007ffd091cb500
2025-05-12T22:31:54.795309+02:00 lisa kernel: [    C3] R13: 000000000000000=
0 R14: 0000000000000001 R15: 0000000000000000
2025-05-12T22:31:54.795311+02:00 lisa kernel: [    C3]  </TASK>
2025-05-12T22:31:54.795316+02:00 lisa kernel: [   C10] watchdog: BUG: soft =
lockup - CPU#10 stuck for 97s! [Isolated Web Co:2298]
2025-05-12T22:31:54.795318+02:00 lisa kernel: [   C10] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:31:54.795320+02:00 lisa kernel: [   C10]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:31:54.795322+02:00 lisa kernel: [   C10] CPU: 10 UID: 1000 PI=
D: 2298 Comm: Isolated Web Co Tainted: G             L      6.15.0-rc2-bise=
ct-00574-gfe80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:31:54.795327+02:00 lisa kernel: [   C10] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:31:54.795329+02:00 lisa kernel: [   C10] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:31:54.795331+02:00 lisa kernel: [   C10] RIP: 0010:smp_call_f=
unction_many_cond+0x303/0x350
2025-05-12T22:31:54.795332+02:00 lisa kernel: [   C10] Code: bc c8 f7 c1 f0=
 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be f7 44 02 08=
 01 00 00 00 74 bd f3 90 8b 74 10 08 <40> f6 c6 01 75 f4 eb af 65 48 8b 05 =
8d 02 6d 01 48 3b 44 24 38 75
2025-05-12T22:31:54.795334+02:00 lisa kernel: [   C10] RSP: 0018:ffffd3bdc1=
6af9c8 EFLAGS: 00000202
2025-05-12T22:31:54.795336+02:00 lisa kernel: [   C10] RAX: ffffffffbf063e6=
0 RBX: ffff8c456e8a31c0 RCX: 0000000000000006
2025-05-12T22:31:54.795341+02:00 lisa kernel: [   C10] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c456e8a1240
2025-05-12T22:31:54.795343+02:00 lisa kernel: [   C10] RBP: 000000000000000=
3 R08: ffffffffffffffff R09: ffffffffffffffff
2025-05-12T22:31:54.795344+02:00 lisa kernel: [   C10] R10: ffff8c45af84400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:31:54.795346+02:00 lisa kernel: [   C10] R13: 000000000000000=
1 R14: 0000000000000202 R15: 0000000000000006
2025-05-12T22:31:54.795348+02:00 lisa kernel: [   C10] FS:  00007fd4b176dbc=
0(0000) GS:ffff8c45af844000(0000) knlGS:0000000000000000
2025-05-12T22:31:54.795349+02:00 lisa kernel: [   C10] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:31:54.795354+02:00 lisa kernel: [   C10] CR2: 00007fd48a9dcfe=
0 CR3: 000000021b420000 CR4: 0000000000750ef0
2025-05-12T22:31:54.795356+02:00 lisa kernel: [   C10] PKRU: 55555554
2025-05-12T22:31:54.795358+02:00 lisa kernel: [   C10] Call Trace:
2025-05-12T22:31:54.795360+02:00 lisa kernel: [   C10]  <TASK>
2025-05-12T22:31:54.795361+02:00 lisa kernel: [   C10]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:31:54.795363+02:00 lisa kernel: [   C10]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:31:54.795365+02:00 lisa kernel: [   C10]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:31:54.795370+02:00 lisa kernel: [   C10]  tlb_flush_mmu+0x79/=
0x1b0
2025-05-12T22:31:54.795372+02:00 lisa kernel: [   C10]  tlb_finish_mmu+0x3f=
/0x80
2025-05-12T22:31:54.795373+02:00 lisa kernel: [   C10]  vms_clear_ptes+0x11=
8/0x150
2025-05-12T22:31:54.795375+02:00 lisa kernel: [   C10]  ? vms_gather_munmap=
_vmas+0x210/0x2a0
2025-05-12T22:31:54.795377+02:00 lisa kernel: [   C10]  mmap_region+0x4ae/0=
xc50
2025-05-12T22:31:54.795378+02:00 lisa kernel: [   C10]  do_mmap+0x4ab/0x5e0
2025-05-12T22:31:54.795386+02:00 lisa kernel: [   C10]  vm_mmap_pgoff+0xe6/=
0x190
2025-05-12T22:31:54.795388+02:00 lisa kernel: [   C10]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:31:54.795390+02:00 lisa kernel: [   C10]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.795392+02:00 lisa kernel: [   C10]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.795393+02:00 lisa kernel: [   C10]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:31:54.795395+02:00 lisa kernel: [   C10] RIP: 0033:0x7fd4b18c=
2779
2025-05-12T22:31:54.795400+02:00 lisa kernel: [   C10] Code: ff c3 66 2e 0f=
 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d=
 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d =
4f 86 0d 00 f7 d8 64 89 01 48
2025-05-12T22:31:54.795402+02:00 lisa kernel: [   C10] RSP: 002b:00007fff99=
0a2298 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
2025-05-12T22:31:54.795404+02:00 lisa kernel: [   C10] RAX: ffffffffffffffd=
a RBX: 0000000000500000 RCX: 00007fd4b18c2779
2025-05-12T22:31:54.795463+02:00 lisa kernel: [   C10] RDX: 000000000000000=
0 RSI: 0000000000500000 RDI: 00007fd48f600000
2025-05-12T22:31:54.795465+02:00 lisa kernel: [   C10] RBP: 00007fd4b160210=
0 R08: 00000000ffffffff R09: 0000000000000000
2025-05-12T22:31:54.795467+02:00 lisa kernel: [   C10] R10: 000000000000003=
2 R11: 0000000000000246 R12: 00007fd48f600000
2025-05-12T22:31:54.795470+02:00 lisa kernel: [   C10] R13: 00007fd48a99e00=
0 R14: 0000000000500000 R15: 00007fd48f600000
2025-05-12T22:31:54.795474+02:00 lisa kernel: [   C10]  </TASK>
2025-05-12T22:31:54.795476+02:00 lisa kernel: [   C12] watchdog: BUG: soft =
lockup - CPU#12 stuck for 86s! [Xorg:1388]
2025-05-12T22:31:54.795478+02:00 lisa kernel: [   C12] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:31:54.795479+02:00 lisa kernel: [   C12]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:31:54.795485+02:00 lisa kernel: [   C12] CPU: 12 UID: 1000 PI=
D: 1388 Comm: Xorg Tainted: G             L      6.15.0-rc2-bisect-00574-gf=
e80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:31:54.795487+02:00 lisa kernel: [   C12] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:31:54.795489+02:00 lisa kernel: [   C12] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:31:54.795490+02:00 lisa kernel: [   C12] RIP: 0010:smp_call_f=
unction_many_cond+0x303/0x350
2025-05-12T22:31:54.795492+02:00 lisa kernel: [   C12] Code: bc c8 f7 c1 f0=
 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be f7 44 02 08=
 01 00 00 00 74 bd f3 90 8b 74 10 08 <40> f6 c6 01 75 f4 eb af 65 48 8b 05 =
8d 02 6d 01 48 3b 44 24 38 75
2025-05-12T22:31:54.795498+02:00 lisa kernel: [   C12] RSP: 0018:ffffd3bdc4=
c07b28 EFLAGS: 00000202
2025-05-12T22:31:54.795499+02:00 lisa kernel: [   C12] RAX: ffffffffbf063e8=
0 RBX: ffff8c456e9231c0 RCX: 0000000000000006
2025-05-12T22:31:54.795501+02:00 lisa kernel: [   C12] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c456e921240
2025-05-12T22:31:54.795503+02:00 lisa kernel: [   C12] RBP: 000000000000000=
3 R08: 0000000000000000 R09: 0000000000200000
2025-05-12T22:31:54.795504+02:00 lisa kernel: [   C12] R10: ffff8c45af8c400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:31:54.795506+02:00 lisa kernel: [   C12] R13: 000000000000000=
0 R14: 0000000000000202 R15: 0000000000000006
2025-05-12T22:31:54.795511+02:00 lisa kernel: [   C12] FS:  00007f460cbc8b0=
0(0000) GS:ffff8c45af8c4000(0000) knlGS:0000000000000000
2025-05-12T22:31:54.795513+02:00 lisa kernel: [   C12] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:31:54.795515+02:00 lisa kernel: [   C12] CR2: 00007f474c7a800=
9 CR3: 0000000108ffa000 CR4: 0000000000750ef0
2025-05-12T22:31:54.795516+02:00 lisa kernel: [   C12] PKRU: 55555554
2025-05-12T22:31:54.795518+02:00 lisa kernel: [   C12] Call Trace:
2025-05-12T22:31:54.795520+02:00 lisa kernel: [   C12]  <TASK>
2025-05-12T22:31:54.795521+02:00 lisa kernel: [   C12]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:31:54.795527+02:00 lisa kernel: [   C12]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:31:54.795528+02:00 lisa kernel: [   C12]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:31:54.795530+02:00 lisa kernel: [   C12]  tlb_flush_mmu+0x79/=
0x1b0
2025-05-12T22:31:54.795532+02:00 lisa kernel: [   C12]  tlb_finish_mmu+0x3f=
/0x80
2025-05-12T22:31:54.795534+02:00 lisa kernel: [   C12]  vms_clear_ptes+0x11=
8/0x150
2025-05-12T22:31:54.795535+02:00 lisa kernel: [   C12]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.795547+02:00 lisa kernel: [   C12]  ? mas_store_gfp+0xe=
0/0x190
2025-05-12T22:31:54.795550+02:00 lisa kernel: [   C12]  vms_complete_munmap=
_vmas+0x78/0x1b0
2025-05-12T22:31:54.795552+02:00 lisa kernel: [   C12]  do_vmi_align_munmap=
+0x251/0x290
2025-05-12T22:31:54.795553+02:00 lisa kernel: [   C12]  ? __pfx_amdgpu_gem_=
va_ioctl+0x10/0x10 [amdgpu]
2025-05-12T22:31:54.795555+02:00 lisa kernel: [   C12]  do_vmi_munmap+0xd6/=
0x100
2025-05-12T22:31:54.795557+02:00 lisa kernel: [   C12]  __vm_munmap+0xcc/0x=
130
2025-05-12T22:31:54.795559+02:00 lisa kernel: [   C12]  __x64_sys_munmap+0x=
16/0x20
2025-05-12T22:31:54.795564+02:00 lisa kernel: [   C12]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:31:54.795566+02:00 lisa kernel: [   C12]  ? __irq_exit_rcu+0x=
6d/0xf0
2025-05-12T22:31:54.795568+02:00 lisa kernel: [   C12]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.795569+02:00 lisa kernel: [   C12]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:31:54.795571+02:00 lisa kernel: [   C12] RIP: 0033:0x7f460cf4=
a6d7
2025-05-12T22:31:54.795573+02:00 lisa kernel: [   C12] Code: 73 01 c3 48 8b=
 0d 21 97 0d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00=
 0f 1f 44 00 00 b8 0b 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d =
f1 96 0d 00 f7 d8 64 89 01 48
2025-05-12T22:31:54.795578+02:00 lisa kernel: [   C12] RSP: 002b:00007fff32=
a17e88 EFLAGS: 00000246 ORIG_RAX: 000000000000000b
2025-05-12T22:31:54.795580+02:00 lisa kernel: [   C12] RAX: ffffffffffffffd=
a RBX: 000055a7ad46a260 RCX: 00007f460cf4a6d7
2025-05-12T22:31:54.795582+02:00 lisa kernel: [   C12] RDX: 000000000000000=
1 RSI: 0000000000200000 RDI: 00007f45a7e00000
2025-05-12T22:31:54.795583+02:00 lisa kernel: [   C12] RBP: 000055a7abb0e24=
0 R08: 0000000000000030 R09: 0000000000000000
2025-05-12T22:31:54.795585+02:00 lisa kernel: [   C12] R10: 000000000000000=
1 R11: 0000000000000246 R12: 000055a7ad46a280
2025-05-12T22:31:54.795587+02:00 lisa kernel: [   C12] R13: 000055a7ad51b63=
0 R14: 000055a7ad210a80 R15: 000055a7abb1a530
2025-05-12T22:31:54.795592+02:00 lisa kernel: [   C12]  </TASK>
2025-05-12T22:31:54.795594+02:00 lisa kernel: [   C11] watchdog: BUG: soft =
lockup - CPU#11 stuck for 105s! [cc1:37564]
2025-05-12T22:31:54.795595+02:00 lisa kernel: [   C11] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:31:54.795597+02:00 lisa kernel: [   C11]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:31:54.795602+02:00 lisa kernel: [   C11] CPU: 11 UID: 1000 PI=
D: 37564 Comm: cc1 Tainted: G             L      6.15.0-rc2-bisect-00574-gf=
e80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:31:54.795604+02:00 lisa kernel: [   C11] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:31:54.795606+02:00 lisa kernel: [   C11] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:31:54.795608+02:00 lisa kernel: [   C11] RIP: 0010:smp_call_f=
unction_many_cond+0x2ff/0x350
2025-05-12T22:31:54.795609+02:00 lisa kernel: [   C11] Code: 35 f3 48 0f bc=
 c8 f7 c1 f0 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be=
 f7 44 02 08 01 00 00 00 74 bd f3 90 <8b> 74 10 08 40 f6 c6 01 75 f4 eb af =
65 48 8b 05 8d 02 6d 01 48 3b
2025-05-12T22:31:54.795611+02:00 lisa kernel: [   C11] RSP: 0018:ffffd3bde2=
15fc40 EFLAGS: 00000202
2025-05-12T22:31:54.795617+02:00 lisa kernel: [   C11] RAX: ffffffffbf063f6=
0 RBX: ffff8c456e8e31c0 RCX: 0000000000000006
2025-05-12T22:31:54.795618+02:00 lisa kernel: [   C11] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c37d053f200
2025-05-12T22:31:54.795694+02:00 lisa kernel: [   C11] RBP: 000000000000000=
3 R08: 0000000000000000 R09: ffffffffffffffff
2025-05-12T22:31:54.795695+02:00 lisa kernel: [   C11] R10: ffff8c45af88400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:31:54.795697+02:00 lisa kernel: [   C11] R13: 000000000000000=
1 R14: 0000000000000202 R15: 0000000000000006
2025-05-12T22:31:54.795699+02:00 lisa kernel: [   C11] FS:  000000000000000=
0(0000) GS:ffff8c45af884000(0000) knlGS:0000000000000000
2025-05-12T22:31:54.795705+02:00 lisa kernel: [   C11] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:31:54.795707+02:00 lisa kernel: [   C11] CR2: 00007f92caf1728=
0 CR3: 0000000b6083c000 CR4: 0000000000750ef0
2025-05-12T22:31:54.795708+02:00 lisa kernel: [   C11] PKRU: 55555554
2025-05-12T22:31:54.795710+02:00 lisa kernel: [   C11] Call Trace:
2025-05-12T22:31:54.795712+02:00 lisa kernel: [   C11]  <TASK>
2025-05-12T22:31:54.795714+02:00 lisa kernel: [   C11]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:31:54.795717+02:00 lisa kernel: [   C11]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:31:54.795721+02:00 lisa kernel: [   C11]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:31:54.795723+02:00 lisa kernel: [   C11]  tlb_flush_mmu+0x79/=
0x1b0
2025-05-12T22:31:54.795725+02:00 lisa kernel: [   C11]  tlb_finish_mmu+0x3f=
/0x80
2025-05-12T22:31:54.795726+02:00 lisa kernel: [   C11]  exit_mmap+0x1cc/0x2=
d0
2025-05-12T22:31:54.795728+02:00 lisa kernel: [   C11]  __mmput+0x26/0xe0
2025-05-12T22:31:54.795730+02:00 lisa kernel: [   C11]  exit_mm+0x94/0xc0
2025-05-12T22:31:54.795735+02:00 lisa kernel: [   C11]  do_exit+0x1f0/0x860
2025-05-12T22:31:54.795737+02:00 lisa kernel: [   C11]  ? rt_spin_lock+0x3d=
/0xa0
2025-05-12T22:31:54.795739+02:00 lisa kernel: [   C11]  do_group_exit+0x96/=
0xa0
2025-05-12T22:31:54.795740+02:00 lisa kernel: [   C11]  __x64_sys_exit_grou=
p+0x12/0x20
2025-05-12T22:31:54.795742+02:00 lisa kernel: [   C11]  x64_sys_call+0x21ba=
/0x21c0
2025-05-12T22:31:54.795743+02:00 lisa kernel: [   C11]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:31:54.795749+02:00 lisa kernel: [   C11]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.795750+02:00 lisa kernel: [   C11]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.795752+02:00 lisa kernel: [   C11]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:31:54.795754+02:00 lisa kernel: [   C11] RIP: 0033:0x7f92caf1=
7295
2025-05-12T22:31:54.795756+02:00 lisa kernel: [   C11] Code: Unable to acce=
ss opcode bytes at 0x7f92caf1726b.
2025-05-12T22:31:54.795757+02:00 lisa kernel: [   C11] RSP: 002b:00007ffd99=
8f6ec8 EFLAGS: 00000206 ORIG_RAX: 00000000000000e7
2025-05-12T22:31:54.795759+02:00 lisa kernel: [   C11] RAX: ffffffffffffffd=
a RBX: 00007f92cb022fe8 RCX: 00007f92caf17295
2025-05-12T22:31:54.795765+02:00 lisa kernel: [   C11] RDX: 00000000000000e=
7 RSI: fffffffffffffbf8 RDI: 0000000000000000
2025-05-12T22:31:54.795767+02:00 lisa kernel: [   C11] RBP: 000000000000000=
0 R08: 00007ffd998f6e58 R09: 0000000000000000
2025-05-12T22:31:54.795769+02:00 lisa kernel: [   C11] R10: 00007ffd998f6cf=
0 R11: 0000000000000206 R12: 00007f92cb021680
2025-05-12T22:31:54.795770+02:00 lisa kernel: [   C11] R13: 00007f92cb5bac8=
0 R14: 0000000000000040 R15: 00007f92cb023000
2025-05-12T22:31:54.795772+02:00 lisa kernel: [   C11]  </TASK>
2025-05-12T22:31:54.795774+02:00 lisa kernel: [   C13] watchdog: BUG: soft =
lockup - CPU#13 stuck for 104s! [cc1:37695]
2025-05-12T22:31:54.795779+02:00 lisa kernel: [   C13] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:31:54.795781+02:00 lisa kernel: [   C13]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:31:54.795783+02:00 lisa kernel: [   C13] CPU: 13 UID: 1000 PI=
D: 37695 Comm: cc1 Tainted: G             L      6.15.0-rc2-bisect-00574-gf=
e80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:31:54.795785+02:00 lisa kernel: [   C13] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:31:54.795790+02:00 lisa kernel: [   C13] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:31:54.795792+02:00 lisa kernel: [   C13] RIP: 0010:smp_call_f=
unction_many_cond+0x303/0x350
2025-05-12T22:31:54.795794+02:00 lisa kernel: [   C13] Code: bc c8 f7 c1 f0=
 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be f7 44 02 08=
 01 00 00 00 74 bd f3 90 8b 74 10 08 <40> f6 c6 01 75 f4 eb af 65 48 8b 05 =
8d 02 6d 01 48 3b 44 24 38 75
2025-05-12T22:31:54.795795+02:00 lisa kernel: [   C13] RSP: 0018:ffffd3bde2=
5bfc40 EFLAGS: 00000202
2025-05-12T22:31:54.795797+02:00 lisa kernel: [   C13] RAX: ffffffffbf063f8=
0 RBX: ffff8c456e9631c0 RCX: 0000000000000006
2025-05-12T22:31:54.795799+02:00 lisa kernel: [   C13] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c456e961240
2025-05-12T22:31:54.795804+02:00 lisa kernel: [   C13] RBP: 000000000000000=
3 R08: 0000000000000000 R09: ffffffffffffffff
2025-05-12T22:31:54.795806+02:00 lisa kernel: [   C13] R10: ffff8c45af90400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:31:54.795808+02:00 lisa kernel: [   C13] R13: 000000000000000=
0 R14: 0000000000000202 R15: 0000000000000006
2025-05-12T22:31:54.795809+02:00 lisa kernel: [   C13] FS:  000000000000000=
0(0000) GS:ffff8c45af904000(0000) knlGS:0000000000000000
2025-05-12T22:31:54.795811+02:00 lisa kernel: [   C13] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:31:54.795813+02:00 lisa kernel: [   C13] CR2: 000055c7f775300=
8 CR3: 0000000b6083c000 CR4: 0000000000750ef0
2025-05-12T22:31:54.795818+02:00 lisa kernel: [   C13] PKRU: 55555554
2025-05-12T22:31:54.795819+02:00 lisa kernel: [   C13] Call Trace:
2025-05-12T22:31:54.795821+02:00 lisa kernel: [   C13]  <TASK>
2025-05-12T22:31:54.795823+02:00 lisa kernel: [   C13]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:31:54.795825+02:00 lisa kernel: [   C13]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:31:54.795827+02:00 lisa kernel: [   C13]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:31:54.795832+02:00 lisa kernel: [   C13]  tlb_flush_mmu+0x79/=
0x1b0
2025-05-12T22:31:54.795834+02:00 lisa kernel: [   C13]  tlb_finish_mmu+0x3f=
/0x80
2025-05-12T22:31:54.795836+02:00 lisa kernel: [   C13]  exit_mmap+0x1cc/0x2=
d0
2025-05-12T22:31:54.795838+02:00 lisa kernel: [   C13]  __mmput+0x26/0xe0
2025-05-12T22:31:54.795839+02:00 lisa kernel: [   C13]  exit_mm+0x94/0xc0
2025-05-12T22:31:54.795841+02:00 lisa kernel: [   C13]  do_exit+0x1f0/0x860
2025-05-12T22:31:54.795842+02:00 lisa kernel: [   C13]  ? rt_spin_lock+0x3d=
/0xa0
2025-05-12T22:31:54.795848+02:00 lisa kernel: [   C13]  do_group_exit+0x96/=
0xa0
2025-05-12T22:31:54.795849+02:00 lisa kernel: [   C13]  __x64_sys_exit_grou=
p+0x12/0x20
2025-05-12T22:31:54.795851+02:00 lisa kernel: [   C13]  x64_sys_call+0x21ba=
/0x21c0
2025-05-12T22:31:54.795853+02:00 lisa kernel: [   C13]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:31:54.795854+02:00 lisa kernel: [   C13]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.795856+02:00 lisa kernel: [   C13]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.795861+02:00 lisa kernel: [   C13]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:31:54.795863+02:00 lisa kernel: [   C13] RIP: 0033:0x7fd02e53=
8295
2025-05-12T22:31:54.795865+02:00 lisa kernel: [   C13] Code: Unable to acce=
ss opcode bytes at 0x7fd02e53826b.
2025-05-12T22:31:54.795866+02:00 lisa kernel: [   C13] RSP: 002b:00007ffd34=
20ef28 EFLAGS: 00000206 ORIG_RAX: 00000000000000e7
2025-05-12T22:31:54.795868+02:00 lisa kernel: [   C13] RAX: ffffffffffffffd=
a RBX: 00007fd02e643fe8 RCX: 00007fd02e538295
2025-05-12T22:31:54.795870+02:00 lisa kernel: [   C13] RDX: 00000000000000e=
7 RSI: fffffffffffffbf8 RDI: 0000000000000000
2025-05-12T22:31:54.795871+02:00 lisa kernel: [   C13] RBP: 000000000000000=
0 R08: 00007ffd3420eeb8 R09: 0000000000000000
2025-05-12T22:31:54.795876+02:00 lisa kernel: [   C13] R10: 00007ffd3420ed5=
0 R11: 0000000000000206 R12: 00007fd02e642680
2025-05-12T22:31:54.795878+02:00 lisa kernel: [   C13] R13: 00007fd02ebdbc8=
0 R14: 0000000000000040 R15: 00007fd02e644000
2025-05-12T22:31:54.795880+02:00 lisa kernel: [   C13]  </TASK>
2025-05-12T22:31:54.795881+02:00 lisa kernel: [    C3] watchdog: BUG: soft =
lockup - CPU#3 stuck for 100s! [xfsettingsd:1693]
2025-05-12T22:31:54.795942+02:00 lisa kernel: [    C3] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:31:54.795947+02:00 lisa kernel: [    C3]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:31:54.795949+02:00 lisa kernel: [    C3] CPU: 3 UID: 1000 PID=
: 1693 Comm: xfsettingsd Tainted: G             L      6.15.0-rc2-bisect-00=
574-gfe80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:31:54.795950+02:00 lisa kernel: [    C3] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:31:54.795952+02:00 lisa kernel: [    C3] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:31:54.795954+02:00 lisa kernel: [    C3] RIP: 0010:smp_call_f=
unction_many_cond+0x303/0x350
2025-05-12T22:31:54.795959+02:00 lisa kernel: [    C3] Code: bc c8 f7 c1 f0=
 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be f7 44 02 08=
 01 00 00 00 74 bd f3 90 8b 74 10 08 <40> f6 c6 01 75 f4 eb af 65 48 8b 05 =
8d 02 6d 01 48 3b 44 24 38 75
2025-05-12T22:31:54.795961+02:00 lisa kernel: [    C3] RSP: 0018:ffffd3bdc6=
5cfc28 EFLAGS: 00000202
2025-05-12T22:31:54.795962+02:00 lisa kernel: [    C3] RAX: ffffffffbf063ee=
0 RBX: ffff8c456e6e31c0 RCX: 0000000000000006
2025-05-12T22:31:54.795964+02:00 lisa kernel: [    C3] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c456e6e1240
2025-05-12T22:31:54.795966+02:00 lisa kernel: [    C3] RBP: 000000000000000=
3 R08: ffffffffffffffff R09: ffffffffffffffff
2025-05-12T22:31:54.795967+02:00 lisa kernel: [    C3] R10: ffff8c45af68400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:31:54.795973+02:00 lisa kernel: [    C3] R13: 000000000000000=
e R14: 0000000000000202 R15: 0000000000000000
2025-05-12T22:31:54.795975+02:00 lisa kernel: [    C3] FS:  00007f0621c91b0=
0(0000) GS:ffff8c45af684000(0000) knlGS:0000000000000000
2025-05-12T22:31:54.795977+02:00 lisa kernel: [    C3] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:31:54.795979+02:00 lisa kernel: [    C3] CR2: 00000cbd4746a30=
0 CR3: 0000000301556000 CR4: 0000000000750ef0
2025-05-12T22:31:54.795980+02:00 lisa kernel: [    C3] PKRU: 55555554
2025-05-12T22:31:54.795982+02:00 lisa kernel: [    C3] Call Trace:
2025-05-12T22:31:54.795987+02:00 lisa kernel: [    C3]  <TASK>
2025-05-12T22:31:54.795989+02:00 lisa kernel: [    C3]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:31:54.795991+02:00 lisa kernel: [    C3]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:31:54.795992+02:00 lisa kernel: [    C3]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:31:54.795994+02:00 lisa kernel: [    C3]  copy_mm+0x6d2/0x890
2025-05-12T22:31:54.795995+02:00 lisa kernel: [    C3]  copy_process+0x6b5/=
0xf90
2025-05-12T22:31:54.796000+02:00 lisa kernel: [    C3]  kernel_clone+0x94/0=
x2e0
2025-05-12T22:31:54.796002+02:00 lisa kernel: [    C3]  ? rt_spin_lock+0x3d=
/0xa0
2025-05-12T22:31:54.796004+02:00 lisa kernel: [    C3]  __x64_sys_clone+0xc=
3/0xf0
2025-05-12T22:31:54.796006+02:00 lisa kernel: [    C3]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:31:54.796007+02:00 lisa kernel: [    C3]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.796009+02:00 lisa kernel: [    C3]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:31:54.796011+02:00 lisa kernel: [    C3] RIP: 0033:0x7f0622ca=
4202
2025-05-12T22:31:54.796019+02:00 lisa kernel: [    C3] Code: 89 e7 e8 71 3b=
 f6 ff 45 31 c0 31 d2 31 f6 64 48 8b 04 25 10 00 00 00 bf 11 00 20 01 4c 8d=
 90 d0 02 00 00 b8 38 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 5e 89 c5 85 c0 =
75 31 64 48 8b 04 25 10 00 00
2025-05-12T22:31:54.796021+02:00 lisa kernel: [    C3] RSP: 002b:00007ffd09=
1cb4d0 EFLAGS: 00000246 ORIG_RAX: 0000000000000038
2025-05-12T22:31:54.796022+02:00 lisa kernel: [    C3] RAX: ffffffffffffffd=
a RBX: 00007ffd091cb4d0 RCX: 00007f0622ca4202
2025-05-12T22:31:54.796024+02:00 lisa kernel: [    C3] RDX: 000000000000000=
0 RSI: 0000000000000000 RDI: 0000000001200011
2025-05-12T22:31:54.796025+02:00 lisa kernel: [    C3] RBP: 00007ffd091cba2=
0 R08: 0000000000000000 R09: 0000000000000000
2025-05-12T22:31:54.796027+02:00 lisa kernel: [    C3] R10: 00007f0621c91dd=
0 R11: 0000000000000246 R12: 00007ffd091cb500
2025-05-12T22:31:54.796032+02:00 lisa kernel: [    C3] R13: 000000000000000=
0 R14: 0000000000000001 R15: 0000000000000000
2025-05-12T22:31:54.796034+02:00 lisa kernel: [    C3]  </TASK>
2025-05-12T22:31:54.796036+02:00 lisa kernel: [   C10] watchdog: BUG: soft =
lockup - CPU#10 stuck for 123s! [Isolated Web Co:2298]
2025-05-12T22:31:54.796038+02:00 lisa kernel: [   C10] Modules linked in: c=
cm snd_seq_dummy snd_hrtimer snd_seq_midi snd_rawmidi snd_seq_midi_event sn=
d_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vfat fat snd_ctl_led s=
nd_hda_codec_realtek snd_hda_scodec_component snd_hda_codec_generic snd_hda=
_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_acp3x_pdm_dma =
snd_soc_dmic snd_acp3x_rn btusb snd_soc_core snd_hwdep btbcm snd_hda_core u=
vcvideo btintel btrtl snd_pcm_oss videobuf2_vmalloc btmtk videobuf2_memops =
uvc videobuf2_v4l2 snd_mixer_oss bluetooth videodev snd_pcm snd_rn_pci_acp3=
x snd_acp_config snd_soc_acpi videobuf2_common snd_timer msi_wmi ecdh_gener=
ic ecc mc sparse_keymap wmi_bmof snd edac_mce_amd snd_pci_acp3x soundcore k=
10temp ccp battery ac button joydev hid_sensor_gyro_3d hid_sensor_als hid_s=
ensor_accel_3d hid_sensor_magn_3d hid_sensor_prox hid_sensor_trigger hid_se=
nsor_iio_common industrialio_triggered_buffer kfifo_buf amd_pmc industriali=
o evdev mt7921e mt7921_common mt792x_lib mt76_connac_lib mt76 mac80211 liba=
rc4 cfg80211 rfkill msr
2025-05-12T22:31:54.796039+02:00 lisa kernel: [   C10]  fuse nvme_fabrics e=
fi_pstore configfs efivarfs autofs4 ext4 mbcache jbd2 amdgpu usbhid drm_pan=
el_backlight_quirks cec drm_buddy drm_suballoc_helper drm_exec i2c_algo_bit=
 drm_display_helper xhci_pci gpu_sched xhci_hcd hid_sensor_hub hid_multitou=
ch drm_ttm_helper mfd_core hid_generic ttm usbcore i2c_hid_acpi drm_client_=
lib psmouse nvme amd_sfh i2c_hid drm_kms_helper nvme_core hid serio_raw r81=
69 usb_common i2c_piix4 amdxcp crc16 i2c_smbus i2c_designware_platform i2c_=
designware_core
2025-05-12T22:31:54.796045+02:00 lisa kernel: [   C10] CPU: 10 UID: 1000 PI=
D: 2298 Comm: Isolated Web Co Tainted: G             L      6.15.0-rc2-bise=
ct-00574-gfe80b0e53d36 #901 PREEMPT_{RT,(full)}=20
2025-05-12T22:31:54.796046+02:00 lisa kernel: [   C10] Tainted: [L]=3DSOFTL=
OCKUP
2025-05-12T22:31:54.796048+02:00 lisa kernel: [   C10] Hardware name: Micro=
-Star International Co., Ltd. Alpha 15 B5EEK/MS-158L, BIOS E158LAMS.10F 11/=
11/2024
2025-05-12T22:31:54.796049+02:00 lisa kernel: [   C10] RIP: 0010:smp_call_f=
unction_many_cond+0x303/0x350
2025-05-12T22:31:54.796051+02:00 lisa kernel: [   C10] Code: bc c8 f7 c1 f0=
 ff ff ff 75 28 48 8b 03 89 ca 83 e2 0f 48 8b 14 d5 50 7a 7d be f7 44 02 08=
 01 00 00 00 74 bd f3 90 8b 74 10 08 <40> f6 c6 01 75 f4 eb af 65 48 8b 05 =
8d 02 6d 01 48 3b 44 24 38 75
2025-05-12T22:31:54.796056+02:00 lisa kernel: [   C10] RSP: 0018:ffffd3bdc1=
6af9c8 EFLAGS: 00000202
2025-05-12T22:31:54.796058+02:00 lisa kernel: [   C10] RAX: ffffffffbf063e6=
0 RBX: ffff8c456e8a31c0 RCX: 0000000000000006
2025-05-12T22:31:54.796060+02:00 lisa kernel: [   C10] RDX: ffff8c45af74400=
0 RSI: 0000000000000011 RDI: ffff8c456e8a1240
2025-05-12T22:31:54.796062+02:00 lisa kernel: [   C10] RBP: 000000000000000=
3 R08: ffffffffffffffff R09: ffffffffffffffff
2025-05-12T22:31:54.796063+02:00 lisa kernel: [   C10] R10: ffff8c45af84400=
0 R11: ffffffffbd886fc0 R12: 0000000000000000
2025-05-12T22:31:54.796065+02:00 lisa kernel: [   C10] R13: 000000000000000=
1 R14: 0000000000000202 R15: 0000000000000006
2025-05-12T22:31:54.796070+02:00 lisa kernel: [   C10] FS:  00007fd4b176dbc=
0(0000) GS:ffff8c45af844000(0000) knlGS:0000000000000000
2025-05-12T22:31:54.796072+02:00 lisa kernel: [   C10] CS:  0010 DS: 0000 E=
S: 0000 CR0: 0000000080050033
2025-05-12T22:31:54.796074+02:00 lisa kernel: [   C10] CR2: 00007fd48a9dcfe=
0 CR3: 000000021b420000 CR4: 0000000000750ef0
2025-05-12T22:31:54.796076+02:00 lisa kernel: [   C10] PKRU: 55555554
2025-05-12T22:31:54.796077+02:00 lisa kernel: [   C10] Call Trace:
2025-05-12T22:31:54.796079+02:00 lisa kernel: [   C10]  <TASK>
2025-05-12T22:31:54.796084+02:00 lisa kernel: [   C10]  ? __pfx_flush_tlb_f=
unc+0x10/0x10
2025-05-12T22:31:54.796086+02:00 lisa kernel: [   C10]  on_each_cpu_cond_ma=
sk+0x1c/0x40
2025-05-12T22:31:54.796087+02:00 lisa kernel: [   C10]  flush_tlb_mm_range+=
0x3f2/0x640
2025-05-12T22:31:54.796089+02:00 lisa kernel: [   C10]  tlb_flush_mmu+0x79/=
0x1b0
2025-05-12T22:31:54.796110+02:00 lisa kernel: [   C10]  tlb_finish_mmu+0x3f=
/0x80
2025-05-12T22:31:54.796111+02:00 lisa kernel: [   C10]  vms_clear_ptes+0x11=
8/0x150
2025-05-12T22:31:54.796113+02:00 lisa kernel: [   C10]  ? vms_gather_munmap=
_vmas+0x210/0x2a0
2025-05-12T22:31:54.796118+02:00 lisa kernel: [   C10]  mmap_region+0x4ae/0=
xc50
2025-05-12T22:31:54.796119+02:00 lisa kernel: [   C10]  do_mmap+0x4ab/0x5e0
2025-05-12T22:31:54.796121+02:00 lisa kernel: [   C10]  vm_mmap_pgoff+0xe6/=
0x190
2025-05-12T22:31:54.796123+02:00 lisa kernel: [   C10]  do_syscall_64+0x6c/=
0xfa0
2025-05-12T22:31:54.796125+02:00 lisa kernel: [   C10]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.796127+02:00 lisa kernel: [   C10]  ? srso_alias_return=
_thunk+0x5/0xfbef5
2025-05-12T22:31:54.796131+02:00 lisa kernel: [   C10]  entry_SYSCALL_64_af=
ter_hwframe+0x76/0x7e
2025-05-12T22:31:54.796133+02:00 lisa kernel: [   C10] RIP: 0033:0x7fd4b18c=
2779
2025-05-12T22:31:54.796135+02:00 lisa kernel: [   C10] Code: ff c3 66 2e 0f=
 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d=
 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d =
4f 86 0d 00 f7 d8 64 89 01 48
2025-05-12T22:31:54.796137+02:00 lisa kernel: [   C10] RSP: 002b:00007fff99=
0a2298 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
2025-05-12T22:31:54.796139+02:00 lisa kernel: [   C10] RAX: ffffffffffffffd=
a RBX: 0000000000500000 RCX: 00007fd4b18c2779
2025-05-12T22:31:54.796140+02:00 lisa kernel: [   C10] RDX: 000000000000000=
0 RSI: 0000000000500000 RDI: 00007fd48f600000
2025-05-12T22:31:54.796146+02:00 lisa kernel: [   C10] RBP: 00007fd4b160210=
0 R08: 00000000ffffffff R09: 0000000000000000
2025-05-12T22:31:54.796148+02:00 lisa kernel: [   C10] R10: 000000000000003=
2 R11: 0000000000000246 R12: 00007fd48f600000
2025-05-12T22:31:54.796149+02:00 lisa kernel: [   C10] R13: 00007fd48a99e00=
0 R14: 0000000000500000 R15: 00007fd48f600000
2025-05-12T22:31:54.796151+02:00 lisa kernel: [   C10]  </TASK>
2025-05-12T22:31:54.796153+02:00 lisa kernel: [  T245] sysrq: Emergency Sync

The bisection proved to be difficult as well and left me with a list of com=
mits
which I "bisected" by hand:

6fcc4294e85f wifi: mwifiex: drop unnecessary initialization BAD
7d902365171c wifi: mwifiex: use adapter as context pointer for mwifiex_hs_a=
ctivated_event()
bf55d51f080e wifi: mwifiex: deduplicate code in mwifiex_cmd_tx_rate_cfg()
39df75eb38fa wifi: mac80211: Replace __get_unaligned_cpu32 in mesh_pathtbl.c
1237c5632fe3 bcma: use new GPIO line value setter callbacks
487637698808 Revert "mac80211: Dynamically set CoDel parameters per station"
996c15bd30a9 wifi: cfg80211/mac80211: remove more 5/10 MHz code
7438843df8cf wifi: iwlwifi: mvm: Avoid -Wflex-array-member-not-at-end warni=
ng
17328a5b6a8f wifi: mac80211: Avoid -Wflex-array-member-not-at-end warnings =
BAD (fixed by reverting 76a853f86c97)
98fd01b4173d dt-bindings: wireless: qcom,wcnss: Use wireless-controller.yaml
c301db25dd69 dt-bindings: wireless: silabs,wfx: Use wireless-controller.yaml
3c3606793f7e dt-bindings: wireless: bcm4329-fmac: Use wireless-controller.y=
aml schema
c7e35b3b007f dt-bindings: net: Add generic wireless controller
dede36400714 dt-bindings: net: Add network-class schema for mac-address pro=
perties
5632a5052bb6 wifi: iwlwifi: fw: api: Absolute rudimentary typo fixes in the=
 file power.h
2b801487ac3b wifi: iwlwifi: Add missing MODULE_FIRMWARE for Qu-c0-jf-b0
9991739ed3ee (HEAD) wifi: iwlwifi: mvm: Remove duplicated include in iwl-ut=
ils.c
76a853f86c97 wifi: free SKBTX_WIFI_STATUS skb tx_flags flag BAD (reverting =
this does not fix next-20250512)

So 76a853f86c97 ("wifi: free SKBTX_WIFI_STATUS skb tx_flags flag BAD") is t=
he first
bad commmit and reverting it fixes things in commit 17328a5b6a8f, but this =
as not
the whole story as this reversion does NOT fix next-20250512.
=20
I'll now start a bisection where I revert 76a853f86c97 where possible in
order to find the remaining bugs.



Bert Karwatzki

