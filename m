Return-Path: <linux-next+bounces-3371-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9398958FD8
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 23:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 085D31C21E10
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 21:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697D21C57B6;
	Tue, 20 Aug 2024 21:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="qBZ3bEnp"
X-Original-To: linux-next@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E0245008;
	Tue, 20 Aug 2024 21:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724190172; cv=none; b=q6VpI2KdHs4hrMj9vwjCaDLD9MOgan64t+VdAJzTrdJOg7kUedv/8Kn7OzPsI1wLc9V/Z4ysrdSkNxltiZTDptRTz1f0oFel6b12TNyMBECLw0fpckGINvewoj6tuepkChBfAfEoHCbwbI+7LDmncqJtBhNGj4VBdrd+SkBtVUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724190172; c=relaxed/simple;
	bh=SAd6aWii8ESQPuXPGkW5fEVmVpI/zN6NQV9z9YwxdOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KKK9h0rb4eSDiWORDJfoaF3752t8QlD1nXcBGqVHGTfHCuXZa+56PdsOCNWqV+oZDx+VCLsOT61cEaA9B4PORxkT2m+5L0ucoc9N4shCNi85ICiAl6lhW+ofF6B+1qV4gowykNOXP54IXQ/w1OvYZuZpGPm6OdpFZKR6nozBncQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=qBZ3bEnp; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4WpNHG0Tltz6ClY9B;
	Tue, 20 Aug 2024 21:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1724190167; x=1726782168; bh=7wbqlgcrcW8LO5mn46JnnBTy
	4DdXrokYdBsMaI68/L0=; b=qBZ3bEnpSpvffYLQBWM+Y6rAk+2j3TaVgrplFrT2
	U8GV786cIm5VuIkMJcEQ9pOTFe2KQJ7fTRifrJJCzmsztXz/E1kI4SNr7qKeuMl5
	XLwX70Tj+Z9GrgCV/qYcKwqRUlFJ1bx26ossiqjZ5jod2p0D57IwPco4l3fMDPLI
	D8WkjoOxcjaigAkTXL6PRrURFhlS1ViN83m6AT8GQoms2g3p3wYF8JxkdMH3T1Tk
	y7sb1X7MSkvUt5iT9RUWf6vbjC3R5zESBsI1Yy9dRSP97POX1q1Zt0D2lLuxm1FY
	dflpQ0wqWtIfnSdaR18sBicYMS9QddBL6NlJQDLkykCR9Q==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id O_Pjr3Qju_HS; Tue, 20 Aug 2024 21:42:47 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4WpNH95H1bz6ClY99;
	Tue, 20 Aug 2024 21:42:45 +0000 (UTC)
Message-ID: <f7d5b327-758d-4577-87ba-6f37b1539781@acm.org>
Date: Tue, 20 Aug 2024 14:42:43 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sysfs: cannot create duplicate filename
 \'/devices/virtual/workqueue/scsi_tmf_-1072727056\''
To: "V, Narasimhan" <Narasimhan.V@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>
Cc: "Petkov, Borislav" <Borislav.Petkov@amd.com>
References: <DM4PR12MB5086B69C0A7E2D51BA312D01898D2@DM4PR12MB5086.namprd12.prod.outlook.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <DM4PR12MB5086B69C0A7E2D51BA312D01898D2@DM4PR12MB5086.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/24 2:25 AM, V, Narasimhan wrote:
> There is a boot warning with next-20240814, and reproduced till today's build.
> 
> [ 8.436312] scsi host0: ahci'
> [ 8.439760] sysfs: cannot create duplicate filename \'/devices/virtual/workqueue/scsi_tmf_-1072727056\''
> [ 8.450058] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.11.0-rc3-next-20240814-1723624235760 #1'
> [ 8.460637] Hardware name: AMD Corporation Shale96/Shale96, BIOS RSH100BD 12/11/2023'
> [ 8.469275] Workqueue: events work_for_cpu_fn'
> [ 8.474137] Call Trace:'
> [ 8.476862] <TASK>'
> [ 8.479199] dump_stack_lvl+0x70/0x90'
> [ 8.483284] dump_stack+0x14/0x20'
> [ 8.486978] sysfs_warn_dup+0x60/0x80'
> [ 8.491061] sysfs_create_dir_ns+0xc0/0xe0'
> [ 8.495626] kobject_add_internal+0xb1/0x2f0'
> [ 8.500387] kobject_add+0x7e/0xf0'
> [ 8.504177] ? srso_alias_return_thunk+0x5/0xfbef5'
> [ 8.509519] ? get_device_parent+0x10e/0x1e0'
> [ 8.514283] device_add+0x125/0x870'
> [ 8.518171] ? srso_alias_return_thunk+0x5/0xfbef5'
> [ 8.523513] ? hrtimer_init+0x2c/0x80'
> [ 8.527597] device_register+0x1f/0x30'
> [ 8.531776] workqueue_sysfs_register+0x91/0x140'
> [ 8.536924] __alloc_workqueue+0x61b/0x7c0'
> [ 8.541491] ? srso_alias_return_thunk+0x5/0xfbef5'
> [ 8.546835] alloc_workqueue+0x52/0x70'
> [ 8.551014] scsi_host_alloc+0x398/0x490'
> [ 8.555391] ata_scsi_add_hosts+0xc2/0x140'
> [ 8.559961] ata_host_register.part.0+0x93/0x250'
> [ 8.565110] ata_host_register+0x35/0x60'
> [ 8.569482] ahci_host_activate+0x145/0x190 [libahci]'
> [ 8.575118] ahci_init_one+0xdcc/0x1050 [ahci]'
> [ 8.580077] local_pci_probe+0x4c/0xb0'
> [ 8.584256] work_for_cpu_fn+0x1b/0x30'
> [ 8.588434] process_one_work+0x17a/0x3b0'
> [ 8.592904] ? __pfx_worker_thread+0x10/0x10'
> [ 8.597666] worker_thread+0x2a0/0x3a0'
> [ 8.601848] ? __pfx_worker_thread+0x10/0x10'
> [ 8.606608] kthread+0xe5/0x120'
> [ 8.610107] ? __pfx_kthread+0x10/0x10'
> [ 8.614286] ret_from_fork+0x3d/0x60'
> [ 8.618271] ? __pfx_kthread+0x10/0x10'
> [ 8.622449] ret_from_fork_asm+0x1a/0x30'
> [ 8.626826] </TASK>'

It's not clear to me how this can happen. scsi_host_alloc() generates
the workqueue name as follows:

	shost->tmf_work_q = alloc_workqueue("scsi_tmf_%d",
				WQ_UNBOUND | WQ_MEM_RECLAIM | WQ_SYSFS,
				1, shost->host_no);

shost->host_no is set as follows:

	index = ida_alloc(&host_index_ida, GFP_KERNEL);
	if (index < 0) {
		kfree(shost);
		return NULL;
	}
	shost->host_no = index;

and 'index' has a signed type. So it's not clear to me how a negative
number can end up in the tmf workqueue name. Am I perhaps overlooking
something?

Thanks,

Bart.

