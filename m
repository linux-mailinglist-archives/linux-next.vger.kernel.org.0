Return-Path: <linux-next+bounces-5315-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE11A1AB5C
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 21:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2840E188E843
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 20:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B681C54AF;
	Thu, 23 Jan 2025 20:26:06 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D071C3BE0
	for <linux-next@vger.kernel.org>; Thu, 23 Jan 2025 20:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737663966; cv=none; b=U5XU8jglEC/l4R5BhDrrWqKZH1DA41vQtJgrnQsYlfD5nZhSGwGtAlVarrdWM4v835YEFT0Innmh5CAN4CwOxFyaB2PwRwamv6tHgfMTzBdEhtxtRL36gnpAFtOSqE1vlk+NT0qCY8hXgZZvXbTluGcZzkT4b6H6qW2bAoA+67M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737663966; c=relaxed/simple;
	bh=rIxNiVzmho3+rpimm2dlg/636vHKZ/2lrjnAUiicpGU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hcVFNBqHVW2jKRhQbt+fG3YqWrnNOhsr8D0zKvsAizq16y5l/hqE25DSay7nYxCKbSazoS5mTApQGyKvQ5hy4JO1QwnADZK+G8LnApDb1sCEljzjR+Fn6P2aHzfuwS69JrRBs7T45ZJBB7SrnWMrh7ShgzgeCekol2FRIyAJ/jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3cfb2d37dbdso8557475ab.2
        for <linux-next@vger.kernel.org>; Thu, 23 Jan 2025 12:26:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737663963; x=1738268763;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAtynoTev00jOel0yFazZ2Sjk6rHWrXUFftQC2AVhpc=;
        b=obs2j0fDWjridHg1Knulfs3UVhY0jHpEvNYEbkBBmQkxLNYmbMlgUgnq8Y+xBCNmP8
         qpSmOPBjszKWI7J5Mg6+FyBXCUNsDtr9aK+xb6n8n+5yPNxMXnhIopqL/TrUFCi4ZhWh
         deys0mYSsUc+zF4oJt/1B/D0/1DwQ0SufI4PHcCr1R9SP1cyhSUurxwebe5GQooSbwyp
         edFaG/GfqDIn+mOwgEeyee0O1Bhb8gxxQUKIewFsCZMkeV0zHAgZSvkhyTC2hhhjTf1f
         FsdOVGsvi8myAImne8And0t9dHK1KtrRSfLCzKvN6YywXmeR87Osg2ruaiM0Og2wgnUp
         GuOA==
X-Forwarded-Encrypted: i=1; AJvYcCWuDsY6heeNQzZrXguXMP3WZlPXMeF4q5o/g5lhTVo1p/h8d7YQHxjDnkAsgDdUMJSZ6CZvLtRTop/H@vger.kernel.org
X-Gm-Message-State: AOJu0YxSo2C2xILdAho26pWI1MCHrqUDk1B2BDmLkX0wEw1XGx9vLmgQ
	r5/J5p7AX07hmgn73rMazplSCOA5gFkHpny04aPv9GRl/sScyQCeDj94x/JHfYNCg5g+fHGK/Rs
	CitD4jzHTBzE/bhNFGyCXHtc7+Ptn+czz9LyiCL1uhKyvTY71dqThK74=
X-Google-Smtp-Source: AGHT+IGwpPalPWt+RfzekEAIz5PfzzOf1JgHmb3Jdwx5AuERs2LD1x1SFFr7L7nhUMy8Z/R6OIbJl52FTd2p1BVYnJE15KS+wosQ
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1686:b0:3ce:8cd1:f671 with SMTP id
 e9e14a558f8ab-3cf744a345cmr246111825ab.21.1737663963459; Thu, 23 Jan 2025
 12:26:03 -0800 (PST)
Date: Thu, 23 Jan 2025 12:26:03 -0800
In-Reply-To: <Z5KTGg7KXfBhHJZA@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6792a5db.050a0220.3ab881.0002.GAE@google.com>
Subject: Re: [syzbot] [kernel?] linux-next test error: KASAN:
 slab-use-after-free Write in binder_add_device
From: syzbot <syzbot+7015dcf45953112c8b45@syzkaller.appspotmail.com>
To: arve@android.com, brauner@kernel.org, cmllamas@google.com, 
	gregkh@linuxfoundation.org, joel@joelfernandes.org, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, maco@android.com, 
	sfr@canb.auug.org.au, surenb@google.com, syzkaller-bugs@googlegroups.com, 
	tkjos@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

0][   T52]  ieee80211_unregister_hw+0x5d/0x2c0
[   72.827744][   T52]  mac80211_hwsim_del_radio+0x2c4/0x4c0
[   72.827761][   T52]  ? __pfx_mac80211_hwsim_del_radio+0x10/0x10
[   72.827777][   T52]  hwsim_exit_net+0x5c1/0x670
[   72.827790][   T52]  ? __pfx_hwsim_exit_net+0x10/0x10
[   72.827802][   T52]  ? __ip_vs_dev_cleanup_batch+0x239/0x260
[   72.827818][   T52]  cleanup_net+0x812/0xd60
[   72.827831][   T52]  ? __pfx_cleanup_net+0x10/0x10
[   72.827847][   T52]  ? process_scheduled_works+0x976/0x1840
[   72.827861][   T52]  process_scheduled_works+0xa66/0x1840
[   72.827882][   T52]  ? __pfx_process_scheduled_works+0x10/0x10
[   72.827898][   T52]  ? assign_work+0x364/0x3d0
[   72.827913][   T52]  worker_thread+0x870/0xd30
[   72.827931][   T52]  ? __kthread_parkme+0x169/0x1d0
[   72.827946][   T52]  ? __pfx_worker_thread+0x10/0x10
[   72.827960][   T52]  kthread+0x7a9/0x920
[   72.827975][   T52]  ? __pfx_kthread+0x10/0x10
[   72.827991][   T52]  ? __pfx_worker_thread+0x10/0x10
[   72.828004][   T52]  ? __pfx_kthread+0x10/0x10
[   72.828019][   T52]  ? __pfx_kthread+0x10/0x10
[   72.828035][   T52]  ? __pfx_kthread+0x10/0x10
[   72.828057][   T52]  ? _raw_spin_unlock_irq+0x23/0x50
[   72.828073][   T52]  ? lockdep_hardirqs_on+0x99/0x150
[   72.828083][   T52]  ? __pfx_kthread+0x10/0x10
[   72.828099][   T52]  ret_from_fork+0x4b/0x80
[   72.828115][   T52]  ? __pfx_kthread+0x10/0x10
[   72.828130][   T52]  ret_from_fork_asm+0x1a/0x30
[   72.828147][   T52]  </TASK>
[   73.225971][ T5846] netdevsim netdevsim0 netdevsim3: renamed from eth3
[   73.272138][ T5846] 8021q: adding VLAN 0 to HW filter on device bond0
[   73.285789][ T5846] 8021q: adding VLAN 0 to HW filter on device team0
[   73.297132][   T12] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   73.304260][   T12] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   73.315883][ T3458] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   73.323014][ T3458] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   73.369208][ T5146] Bluetooth: hci0: command tx timeout
[   73.423445][ T5846] 8021q: adding VLAN 0 to HW filter on device batadv0
[   73.447473][ T5846] veth0_vlan: entered promiscuous mode
[   73.463271][ T5846] veth1_vlan: entered promiscuous mode
[   73.482621][ T5846] veth0_macvtap: entered promiscuous mode
[   73.490813][ T5846] veth1_macvtap: entered promiscuous mode
[   73.503910][ T5846] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   73.513805][ T5846] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   73.525794][ T5846] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   73.534958][ T5846] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   73.543749][ T5846] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   73.553559][ T5846] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
2025/01/23 20:25:37 executed programs: 0
[   73.650024][ T5897] Bluetooth: hci1: unexpected cc 0x0c03 length: 249 > =
1
[   73.657273][ T5897] Bluetooth: hci1: unexpected cc 0x1003 length: 249 > =
9
[   73.658001][   T52] netdevsim netdevsim0 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   73.666246][ T5897] Bluetooth: hci1: unexpected cc 0x1001 length: 249 > =
9
[   73.682494][ T5897] Bluetooth: hci1: unexpected cc 0x0c23 length: 249 > =
4
[   73.690142][ T5897] Bluetooth: hci1: unexpected cc 0x0c25 length: 249 > =
3
[   73.697286][ T5897] Bluetooth: hci1: unexpected cc 0x0c38 length: 249 > =
2
[   73.755858][   T52] netdevsim netdevsim0 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   73.775051][ T5929] chnl_net:caif_netlink_parms(): no params data found
[   73.811171][   T52] netdevsim netdevsim0 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   73.822996][ T5929] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   73.830321][ T5929] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   73.837466][ T5929] bridge_slave_0: entered allmulticast mode
[   73.844302][ T5929] bridge_slave_0: entered promiscuous mode
[   73.854059][   T52] netdevsim netdevsim0 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   73.865862][ T5929] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   73.873181][ T5929] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   73.880397][ T5929] bridge_slave_1: entered allmulticast mode
[   73.886763][ T5929] bridge_slave_1: entered promiscuous mode
[   73.905971][ T5929] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   73.917313][ T5929] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   73.938272][ T5929] team0: Port device team_slave_0 added
[   73.945367][ T5929] team0: Port device team_slave_1 added
[   73.959711][ T5929] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   73.966762][ T5929] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1560 would solve the problem.
[   73.993111][ T5929] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   74.005166][ T5929] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   74.012388][ T5929] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1560 would solve the problem.
[   74.038749][ T5929] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   74.066987][ T5929] hsr_slave_0: entered promiscuous mode
[   74.073635][ T5929] hsr_slave_1: entered promiscuous mode
[   74.079902][ T5929] debugfs: Directory 'hsr0' with parent 'hsr' already =
present!
[   74.087455][ T5929] Cannot create hsr debugfs directory
[   75.449017][ T5897] Bluetooth: hci0: command tx timeout
[   75.769077][ T5897] Bluetooth: hci1: command tx timeout
[   77.119131][   T52] bridge_slave_1: left allmulticast mode
[   77.124824][   T52] bridge_slave_1: left promiscuous mode
[   77.134269][   T52] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   77.142674][   T52] bridge_slave_0: left allmulticast mode
[   77.148309][   T52] bridge_slave_0: left promiscuous mode
[   77.154184][   T52] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   77.253950][   T52] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[   77.263928][   T52] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[   77.273441][   T52] bond0 (unregistering): Released all slaves
[   77.383555][   T52] hsr_slave_0: left promiscuous mode
[   77.390134][   T52] hsr_slave_1: left promiscuous mode
[   77.395926][   T52] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[   77.403407][   T52] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[   77.411905][   T52] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[   77.419472][   T52] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[   77.432774][   T52] veth1_macvtap: left promiscuous mode
[   77.438318][   T52] veth0_macvtap: left promiscuous mode
[   77.447662][   T52] veth1_vlan: left promiscuous mode
[   77.453909][   T52] veth0_vlan: left promiscuous mode
[   77.529653][ T5897] Bluetooth: hci0: command tx timeout
[   77.572399][   T52] team0 (unregistering): Port device team_slave_1 remo=
ved
[   77.596882][   T52] team0 (unregistering): Port device team_slave_0 remo=
ved
[   77.696933][ T5929] netdevsim netdevsim0 netdevsim0: renamed from eth0
[   77.714514][ T5929] netdevsim netdevsim0 netdevsim1: renamed from eth1
[   77.725334][ T5929] netdevsim netdevsim0 netdevsim2: renamed from eth2
[   77.735884][ T5929] netdevsim netdevsim0 netdevsim3: renamed from eth3
[   77.805349][ T5929] 8021q: adding VLAN 0 to HW filter on device bond0
[   77.822003][ T5929] 8021q: adding VLAN 0 to HW filter on device team0
[   77.834543][ T3423] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   77.841705][ T3423] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   77.849243][ T5897] Bluetooth: hci1: command tx timeout
[   77.870686][ T3423] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   77.877810][ T3423] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   77.973541][ T5929] 8021q: adding VLAN 0 to HW filter on device batadv0
[   78.000016][ T5929] veth0_vlan: entered promiscuous mode
[   78.008639][ T5929] veth1_vlan: entered promiscuous mode
[   78.024796][ T5929] veth0_macvtap: entered promiscuous mode
[   78.033395][ T5929] veth1_macvtap: entered promiscuous mode
[   78.045017][ T5929] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   78.056288][ T5929] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   78.065987][ T5929] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   78.074959][ T5929] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   78.084639][ T5929] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   78.093477][ T5929] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   78.115638][ T5929] ieee80211 phy5: Selected rate control algorithm 'min=
strel_ht'
[   78.132089][   T52] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   78.133333][ T5929] ieee80211 phy6: Selected rate control algorithm 'min=
strel_ht'
[   78.150518][   T52] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   78.165307][   T52] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   78.173380][   T52] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50


syzkaller build log:
go env (err=3D<nil>)
GO111MODULE=3D'auto'
GOARCH=3D'amd64'
GOBIN=3D''
GOCACHE=3D'/syzkaller/.cache/go-build'
GOENV=3D'/syzkaller/.config/go/env'
GOEXE=3D''
GOEXPERIMENT=3D''
GOFLAGS=3D''
GOHOSTARCH=3D'amd64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMODCACHE=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs-2/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/usr/local/go'
GOSUMDB=3D'sum.golang.org'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/usr/local/go/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.22.7'
GCCGO=3D'gccgo'
GOAMD64=3D'v1'
AR=3D'ar'
CC=3D'gcc'
CXX=3D'g++'
CGO_ENABLED=3D'1'
GOMOD=3D'/syzkaller/jobs-2/linux/gopath/src/github.com/google/syzkaller/go.=
mod'
GOWORK=3D''
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
PKG_CONFIG=3D'pkg-config'
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build784600658=3D/tmp/go-build -gno-record-gcc=
-switches'

git status (err=3D<nil>)
HEAD detached at f6a35ef3a5
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go: downloading github.com/prometheus/client_golang v1.20.5
go: downloading github.com/VividCortex/gohistogram v1.0.0
go: downloading golang.org/x/sys v0.29.0
go: downloading github.com/cespare/xxhash/v2 v2.3.0
go: downloading github.com/prometheus/procfs v0.15.1
go: downloading github.com/prometheus/client_model v0.6.1
go: downloading github.com/prometheus/common v0.55.0
go: downloading google.golang.org/protobuf v1.35.2
go: downloading github.com/beorn7/perks v1.0.1
go: downloading github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61=
c822
go list -f '{{.Stale}}' ./sys/syz-sysgen | grep -q false || go install ./sy=
s/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build "-ldflags=3D-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3Df6a35ef3a59d5a0ad14de993e51c186016ea91de -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20250123-131638'" -o ./b=
in/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"f6a35ef3a59d5a0ad14de993e51c186016=
ea91de\"
go: downloading github.com/ulikunitz/xz v0.5.12
go: downloading github.com/google/uuid v1.6.0
go: downloading github.com/google/flatbuffers v24.3.25+incompatible
go: downloading google.golang.org/api v0.198.0
go: downloading cloud.google.com/go/storage v1.43.0
go: downloading github.com/ianlancetaylor/demangle v0.0.0-20240312041847-bd=
984b5ce465
go: downloading cloud.google.com/go/spanner v1.67.0
go: downloading golang.org/x/exp v0.0.0-20240909161429-701f63a606c0
go: downloading golang.org/x/sync v0.10.0
go: downloading cloud.google.com/go v0.116.0
go: downloading github.com/sergi/go-diff v1.3.1
go: downloading cloud.google.com/go/bigquery v1.63.0
go: downloading cloud.google.com/go/iam v1.2.1
go: downloading google.golang.org/genproto/googleapis/rpc v0.0.0-2024090314=
3218-8af14fe29dc1
go: downloading google.golang.org/genproto v0.0.0-20240903143218-8af14fe29d=
c1
go: downloading go.opentelemetry.io/otel/trace v1.29.0
go: downloading github.com/googleapis/gax-go/v2 v2.13.0
go: downloading go.opentelemetry.io/otel v1.29.0
go: downloading cloud.google.com/go/compute/metadata v0.5.1
go: downloading google.golang.org/grpc v1.66.2
go: downloading go.opencensus.io v0.24.0
go: downloading golang.org/x/oauth2 v0.24.0
go: downloading google.golang.org/genproto/googleapis/api v0.0.0-2024090314=
3218-8af14fe29dc1
go: downloading go.opentelemetry.io/otel/metric v1.29.0
go: downloading github.com/GoogleCloudPlatform/grpc-gcp-go/grpcgcp v1.5.0
go: downloading github.com/apache/arrow/go/v15 v15.0.2
go: downloading github.com/golang/groupcache v0.0.0-20210331224755-41bb18bf=
e9da
go: downloading github.com/go-logr/logr v1.4.2
go: downloading github.com/go-logr/stdr v1.2.2
go: downloading golang.org/x/net v0.34.0
go: downloading github.com/envoyproxy/go-control-plane v0.12.1-0.2024062101=
3728-1eb8caab5155
go: downloading github.com/cncf/xds/go v0.0.0-20240423153145-555b57ec207b
go: downloading github.com/envoyproxy/protoc-gen-validate v1.0.4
go: downloading cel.dev/expr v0.15.0
go: downloading golang.org/x/xerrors v0.0.0-20240903120638-7835f813f4da
go: downloading github.com/klauspost/compress v1.17.9
go: downloading github.com/pierrec/lz4/v4 v4.1.18
go: downloading github.com/goccy/go-json v0.10.3
go: downloading github.com/zeebo/xxh3 v1.0.2
go: downloading github.com/klauspost/cpuid/v2 v2.2.8
go: downloading golang.org/x/text v0.21.0
go: downloading github.com/census-instrumentation/opencensus-proto v0.4.1
go: downloading cloud.google.com/go/auth/oauth2adapt v0.2.4
go: downloading github.com/google/s2a-go v0.1.8
go: downloading go.opentelemetry.io/contrib/instrumentation/net/http/otelht=
tp v0.54.0
go: downloading cloud.google.com/go/auth v0.9.4
go: downloading go.opentelemetry.io/contrib/instrumentation/google.golang.o=
rg/grpc/otelgrpc v0.54.0
go: downloading github.com/googleapis/enterprise-certificate-proxy v0.3.4
go: downloading golang.org/x/time v0.7.0
go: downloading github.com/felixge/httpsnoop v1.0.4
go: downloading golang.org/x/crypto v0.32.0
/usr/bin/ld: /tmp/cc8ycaYm.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D102ce5df980000


Tested on:

commit:         853d1f41 Add linux-next specific files for 20250123
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D364db892f6981d2=
7
dashboard link: https://syzkaller.appspot.com/bug?extid=3D7015dcf45953112c8=
b45
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debia=
n) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D10d7a9f85800=
00


