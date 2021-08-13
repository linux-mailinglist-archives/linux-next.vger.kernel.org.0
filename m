Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE6A63EADC7
	for <lists+linux-next@lfdr.de>; Fri, 13 Aug 2021 02:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233920AbhHMACs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Aug 2021 20:02:48 -0400
Received: from mail-mw2nam12on2058.outbound.protection.outlook.com ([40.107.244.58]:24768
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229601AbhHMACr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Aug 2021 20:02:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QudJRoqJI1LyB51aJAZ2607SLEtd7EeH5ikWAMMMapoLMpUQWkX4+00n0No95W21LNrUgwJ7bi3tDIo0MA8ur6s7wfV2RNI8p9I07uPVPNdFsq2Tn1Q0/gr2B2SLr5khZDnrxzhVid5iWh/0QT3FjP2hIJ/y8MR5BfW0ba6h4HihECDmCr/viDWHvMqysR+AU2r6ornUNGSB0CeVYgNR8lj/ajrkWIHBnhz7TSos9kikIYMRKDmYMrDhjUq9DymbvbOsf6DTGCxMhXA16VSVTx6rNCkW8TyfxnWhplDxmCmDVSFQvUYwUqF+8QRssOwuO/Pn7vxWURpwthAZxwpt0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9V3Je+QHwlr2GhqDsieR4G5Hz9s3o4e0ddOPvYmtdWs=;
 b=dIR5Doy/2Yyniohqf8Ozy6Svgx1v/BWPVzhD6PWFyW6hLYi2GpTUWhoEwrNh/wOu6nFYz3rZshF5igyOi2HPUvNK7zk3+4mR4bGUfz0aRBJ2xpYZ3j4cnPIAT7UN54ltPIkTzPaMYV4cGkNURi5SrhxakWnJZoamJUk0lOwdGENd0ixUPjLdd+5nbO8PHIroXjXUspnGGNJvmL1VCZWukZ/bmBVa7VBZqTQL5zZDJlOSWEUJGr+NXtkcFuwIMtMqAla53XNRwRJne/ludvttdQeceRRZvLED507Gvz+X134SrahceD+uVnAtQ3qKq4YyeEmCGFR4+cyiT8oo0RBYww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=canb.auug.org.au smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9V3Je+QHwlr2GhqDsieR4G5Hz9s3o4e0ddOPvYmtdWs=;
 b=pV+6sMJ3OZsQrCAdXFVbs/rO3wK65Xdq08bue33qhxg3Oq8pPYEwNX2so9sV2ZOqFAcYJ26bWWcdma7KjZlJbNFZC4gklauNaDkojoYNQz2H4o88XPhcLUq6PafK9zIQs7PlS7oJrCs/cA1UccUplvYX/jpeNCAtXRX7c9pmTydHWVab+Y+ciYPNvulDpLYsZ4vQX0gp1mn1w1swh3tH1lIK4f9RWqJJz4AWcjekRAL/gp8Awg80eXwAAlGqzK/7dWq7Me/DHaPu6g2CWwj3GQycMWc9mDEHxw9W+27yOth4wr1DTOKh/QDjcH0BfeY+xwPyh16AZlADqXo0h8YKzg==
Received: from MWHPR19CA0022.namprd19.prod.outlook.com (2603:10b6:300:d4::32)
 by MWHPR1201MB0128.namprd12.prod.outlook.com (2603:10b6:301:56::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Fri, 13 Aug
 2021 00:02:20 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:d4:cafe::a6) by MWHPR19CA0022.outlook.office365.com
 (2603:10b6:300:d4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Fri, 13 Aug 2021 00:02:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4415.14 via Frontend Transport; Fri, 13 Aug 2021 00:02:19 +0000
Received: from [10.2.93.240] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 Aug
 2021 00:02:18 +0000
Subject: Re: linux-next: Tree for Aug 12
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210812183917.0428a844@canb.auug.org.au>
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <11579941-c2c4-7e1c-e5f2-0171c6551c72@nvidia.com>
Date:   Thu, 12 Aug 2021 17:02:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210812183917.0428a844@canb.auug.org.au>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e284a055-20f7-4989-9d1c-08d95ded9e93
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0128:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB01280B8FB24D7E18064615F6A8FA9@MWHPR1201MB0128.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: za42WNHK4qu0QOBjAoqFkDVYXDFTF1mYQgpZQ4c3VjRTJjQHRLPX9sSM8Ohrl0p3WA/BB5fHjRPet65sS97VfzaY/wiWcsK5TRlnVcAZ5j14OqsnS1wGPlkPQ4DGLoWVK6b4w6Mbtsdya70/EMgsrrx432s1iV5bR0+ZO3UV2Sr7FKgMxhbxcZgqhKkhE5Rzl/8IR73Z7kXg+zOvZIBWRv/wUGBjCHTQd6RBdOBhlF3Q7OzfpS3bVe5bV2oyOcyR6vUW4qwK0zC1vdvRYE3OgxNrDCTyQHCvs7ZlJP5cdKy8vi59NnGt/UOG8f6oLTlahIaXDXTdQDHySk9+u3Kq4KPfYCZq5eXkXTY74ntUW4hHKjW8rjRgAcH4V+0xiJmz82MZhiLC74ntgumIdZI5IZ93HjmxB+F44r/1RI4oakEhBxtiAVZx057wCAJUZ0vXF+OTkKLzJBfSfJz8eFB43MIY0FsjCsRZeK+ZRP6zKp1lfQ1iZzfFJOkC6nXH1KXenqGz8s46qQ5r3ZEfMAcLyCq5DJa3CTjYEviM8ceRf1R9LjtDz9qZ+BKUhNKJvx0yNu1lIQS2UOfyTm14IHLlNSuQj0YSyt4dTJYDaGIYgoPSd8v3VEaMGF2+TC5Fzr1NeciGCuMc2enE325Kyg4pZG5fWCzvNrQJpdjWlseTPhyw8aAWy0J1WZ2iCJI9/Eg5MW9bmjqevamH++KDHbLpOzvCc91M3B7Bnl+YqJjt+Haiuq44Xxjo9eJDi27cP4rT1qbKyIl4ovq89SIv3sMhwB3qGkf4m7WkeOQ8NwrQoUsJtuWRyEfHIuAahgfwM78m
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(36840700001)(46966006)(31696002)(83380400001)(426003)(47076005)(86362001)(5660300002)(70586007)(186003)(70206006)(336012)(2616005)(16526019)(53546011)(26005)(82310400003)(7636003)(36906005)(36756003)(316002)(8676002)(31686004)(2906002)(8936002)(82740400003)(356005)(45080400002)(36860700001)(16576012)(110136005)(966005)(4326008)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 00:02:19.5803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e284a055-20f7-4989-9d1c-08d95ded9e93
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0128
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/12/21 1:39 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20210811:
> 
> The net-next still had its build failure for which I applied a patch.
> 
> The drm tree gained a conflict against Linus' tree.
> 
> The drm-intel tree gained a conflict against the drm tree.
> 
> The drm-msm tree gained a conflict against Linus' tree.
> 
> The kvm-arm tree gained a conflict against the arm64 tree.
> 
> Non-merge commits (relative to Linus' tree): 6805
>   6737 files changed, 392726 insertions(+), 154960 deletions(-)
> 

Hi,

This one is producing hard lockups on my Intel 64bit system now. I'll
attempt to bisect it in a few hours (I have to step away briefly), if
it's not already known/solved. (20210810 worked fine for me.)

evm: HMAC attrs: 0x1
Freeing unused kernel image (initmem) memory: 1720K
usb 1-8: new full-speed USB device number 3 using xhci_hcd
usb 1-8: New USB device found, idVendor=1532, idProduct=0043, bcdDevice= 2.00
usb 1-8: New USB device strings: Mfr=1, Product=2, SerialNumber=0
usb 1-8: Product: Razer DeathAdder Chroma
usb 1-8: Manufacturer: Razer
input: Razer Razer DeathAdder Chroma as 
/devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.0/0003:1532:0043.0003/input/input5
hid-generic 0003:1532:0043.0003: input,hidraw2: USB HID v1.11 Mouse [Razer Razer DeathAdder Chroma] 
on usb-0000:00:14.0-8/input0
input: Razer Razer DeathAdder Chroma Keyboard as 
/devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.1/0003:1532:0043.0004/input/input6
input: Razer Razer DeathAdder Chroma as 
/devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.1/0003:1532:0043.0004/input/input7
hid-generic 0003:1532:0043.0004: input,hidraw3: USB HID v1.11 Keyboard [Razer Razer DeathAdder 
Chroma] on usb-0000:00:14.0-8/input1
input: Razer Razer DeathAdder Chroma as 
/devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.2/0003:1532:0043.0005/input/input8
hid-generic 0003:1532:0043.0005: input,hidraw4: USB HID v1.11 Keyboard [Razer Razer DeathAdder 
Chroma] on usb-0000:00:14.0-8/input2
NMI watchdog: Watchdog detected hard LOCKUP on cpu 6
Modules linked in:
irq event stamp: 2711080
hardirqs last  enabled at (2711079): [<ffffffff811a97e1>] rcu_idle_exit+0x21/0x30
hardirqs last disabled at (2711080): [<ffffffff8114e826>] do_idle+0x86/0xe0
softirqs last  enabled at (2476): [<ffffffff81e002d3>] __do_softirq+0x2d3/0x404
softirqs last disabled at (2465): [<ffffffff8110ebf8>] __irq_exit_rcu+0xa8/0xd0
CPU: 6 PID: 0 Comm: swapper/6 Not tainted 5.14.0-rc5-next-20210812-hubbard-github+ #12
Hardware name: ASUS X299-A/PRIME X299-A, BIOS 3201 09/04/2020
RIP: 0010:rcu_read_lock_sched_held+0xd/0x70
Code: f4 01 41 83 e4 01 44 89 e0 41 5c c3 45 31 e4 44 89 e0 41 5c c3 0f 1f 84 00 00 00 00 00 0f 1f 
44 00 00 41 54 41 bc 01 00 00 00 <e8> 7e e6 98 00 80
RSP: 0000:ffffc900001fbda0 EFLAGS: 00000083
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000002
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff8260b1c8
RBP: ffffffff8260b1c8 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff88887ff80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000005612001 CR4: 00000000003706e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  lock_acquire+0x172/0x2b0
  ? _raw_spin_unlock_irqrestore+0x23/0x40
  ? hrtimer_get_next_event+0x4f/0x60
  tick_nohz_next_event+0x53/0x1f0
  ? tick_nohz_get_sleep_length+0x6b/0xa0
  tick_nohz_get_sleep_length+0x6b/0xa0
  menu_select+0x4bd/0x600
  cpuidle_idle_call+0xf6/0x1d0
  do_idle+0x8d/0xe0
  cpu_startup_entry+0x19/0x20
  secondary_startup_64_no_verify+0xb0/0xbb
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu:    6-...!: (0 ticks this GP) idle=bc8/0/0x0 softirq=20/20 fqs=0  (false positive?)
         (detected by 0, t=65002 jiffies, g=-1107, q=1569)
Sending NMI from CPU 0 to CPUs 6:
NMI backtrace for cpu 6 skipped: idling at poll_idle+0x93/0xb2
rcu: rcu_sched kthread timer wakeup didn't happen for 64999 jiffies! g-1107 f0x0 RCU_GP_WAIT_FQS(5) 
->state=0x402
rcu:    Possible timer handling issue on cpu=6 timer-softirq=11
rcu: rcu_sched kthread starved for 65002 jiffies! g-1107 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=6
rcu:    Unless rcu_sched kthread gets sufficient CPU time, OOM is now expected behavior.
rcu: RCU grace-period kthread stack dump:
task:rcu_sched       state:I stack:14744 pid:   13 ppid:     2 flags:0x00004000
Call Trace:
  __schedule+0x26d/0x790
  schedule+0x59/0xc0
  schedule_timeout+0xc4/0x1f0
  ? _raw_spin_unlock_irqrestore+0x2d/0x40
  ? __bpf_trace_tick_stop+0x10/0x10
  rcu_gp_fqs_loop+0xfa/0x700
  rcu_gp_kthread+0x1d3/0x300
  ? rcu_gp_cleanup+0x610/0x610
  kthread+0x12b/0x150
  ? set_kthread_struct+0x40/0x40
  ret_from_fork+0x22/0x30
rcu: Stack dump where RCU GP kthread last ran:
Sending NMI from CPU 0 to CPUs 6:
NMI backtrace for cpu 6 skipped: idling at poll_idle+0x93/0xb2
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu:    3-...!: (0 ticks this GP) idle=c7c/0/0x0 softirq=43/43 fqs=0  (false positive?)
rcu:    6-...!: (0 ticks this GP) idle=b88/0/0x0 softirq=20/20 fqs=0  (false positive?)
         (detected by 0, t=65002 jiffies, g=-1103, q=1560)
Sending NMI from CPU 0 to CPUs 3:
NMI backtrace for cpu 3
CPU: 3 PID: 0 Comm: swapper/3 Not tainted 5.14.0-rc5-next-20210812-hubbard-github+ #12
Hardware name: ASUS X299-A/PRIME X299-A, BIOS 3201 09/04/2020
RIP: 0010:mwait_idle_with_hints.constprop.0+0x4f/0xa0
Code: 48 89 d1 65 48 8b 04 25 40 70 01 00 0f 01 c8 48 8b 00 a8 08 75 14 eb 07 0f 00 2d 3c 53 a4 00 
b9 01 00 00 00 48 89 f8 0f 01 c9 <65> 48 8b 04 25 4b
RSP: 0000:ffffc900001e3e80 EFLAGS: 00000046
RAX: 0000000000000020 RBX: 0000000000000003 RCX: 0000000000000001
RDX: 0000000000000000 RSI: ffffffff828d6040 RDI: 0000000000000020
RBP: ffffe8ffff2f0b80 R08: 0000000000000000 R09: 0000000000000018
R10: 0000000000000374 R11: 000000000002a055 R12: 0000000000000003
R13: ffffffff828d6190 R14: 0000000000000003 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff88887fec0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000005612001 CR4: 00000000003706e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  intel_idle+0x1f/0x30
  cpuidle_enter_state+0xa5/0x450
  cpuidle_enter+0x29/0x40
  cpuidle_idle_call+0x12c/0x1d0
  do_idle+0x8d/0xe0
  cpu_startup_entry+0x19/0x20
  secondary_startup_64_no_verify+0xb0/0xbb
Sending NMI from CPU 0 to CPUs 6:
NMI backtrace for cpu 6 skipped: idling at poll_idle+0x93/0xb2
rcu: rcu_sched kthread timer wakeup didn't happen for 65031 jiffies! g-1103 f0x0 RCU_GP_WAIT_FQS(5) 
->state=0x402
rcu:    Possible timer handling issue on cpu=6 timer-softirq=11
rcu: rcu_sched kthread starved for 65034 jiffies! g-1103 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=6
rcu:    Unless rcu_sched kthread gets sufficient CPU time, OOM is now expected behavior.
rcu: RCU grace-period kthread stack dump:
task:rcu_sched       state:I stack:14744 pid:   13 ppid:     2 flags:0x00004000
Call Trace:
  __schedule+0x26d/0x790
  schedule+0x59/0xc0
  schedule_timeout+0xc4/0x1f0
  ? _raw_spin_unlock_irqrestore+0x2d/0x40
  ? __bpf_trace_tick_stop+0x10/0x10
  rcu_gp_fqs_loop+0xfa/0x700
  rcu_gp_kthread+0x1d3/0x300
  ? rcu_gp_cleanup+0x610/0x610
  kthread+0x12b/0x150
  ? set_kthread_struct+0x40/0x40
  ret_from_fork+0x22/0x30
rcu: Stack dump where RCU GP kthread last ran:
Sending NMI from CPU 0 to CPUs 6:
NMI backtrace for cpu 6 skipped: idling at poll_idle+0x98/0xb2


thanks,
-- 
John Hubbard
NVIDIA
> ----------------------------------------------------------------------------
> 
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" and checkout or reset to the new
> master.
> 
> You can see which trees have been included by looking in the Next/Trees
> file in the source.  There are also quilt-import.log and merge.log
> files in the Next directory.  Between each merge, the tree was built
> with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
> multi_v7_defconfig for arm and a native build of tools/perf. After
> the final fixups (if any), I do an x86_64 modules_install followed by
> builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
> ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
> and sparc64 defconfig and htmldocs. And finally, a simple boot test
> of the powerpc pseries_le_defconfig kernel in qemu (with and without
> kvm enabled).
> 
> Below is a summary of the state of the merge.
> 
> I am currently merging 333 trees (counting Linus' and 90 trees of bug
> fix patches pending for the current merge release).
> 
> Stats about the size of the tree over time can be seen at
> http://neuling.org/linux-next-size.html .
> 
> Status of my local build tests will be at
> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> advice about cross compilers/configs that work, we are always open to add
> more builds.
> 
> Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
> Gortmaker for triage and bug fixes.
> 


