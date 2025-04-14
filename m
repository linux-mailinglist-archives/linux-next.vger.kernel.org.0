Return-Path: <linux-next+bounces-6219-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1AAA87E89
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 13:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 894B518971A6
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 11:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59634293B47;
	Mon, 14 Apr 2025 11:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CQiPNlnp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GLuBPucj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CQiPNlnp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GLuBPucj"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EFC28D845
	for <linux-next@vger.kernel.org>; Mon, 14 Apr 2025 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744628995; cv=none; b=OTbRzk3E8L+CppWxw9ImQPHMfXYKVFxt/81e3/+ob4XNYOO+qwh6XPxpb0mhTBix5AfL14suCwdzAFAfrXFBsDROXahJYohl2cb60MoL9hXrSzqfKyZWVd+NffzedKYj5H1Vx8F391qOZlT5RGyKezQJijyps+3wfAsaMcIChqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744628995; c=relaxed/simple;
	bh=xEMEidO2PtmhxIZocIqdVpE9XbKrAVxDXfhRm3/vr2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=igxufBwPUzA6/aKei3z33g6oQTnWmnd2XgQBaBCs+/vohdOsajHudlHLd6XH4W2C0uj56WZsi6++ibHN0kyTuH0vAeo7yinyDybsR4UgeXYpsP2Pm0nm6k3AiAZBZAORC4H5pV/Ox+nrfSX4FHWbEWI6New8X2hnRILDBhj/Ixc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CQiPNlnp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GLuBPucj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CQiPNlnp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GLuBPucj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4B65021229;
	Mon, 14 Apr 2025 11:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744628991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=biH39H0HpRLKbVpGyTJ5g0fwQLM6TgEYucn6gZRMXrk=;
	b=CQiPNlnpKHgX3OGervVPa2vbvRP2+7njM5WI35k7xZngxqJfCWyxsyZeLB3iC0asmBKhIM
	gQJsJlMDL96QTZuk4ZJeXKecZC9uyTAcbx9OTsHrv1G215X1meTfBkPRpn35SB47DQQjIq
	q33LZw1B4pXOT1oYiw2xDnqKQotWozI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744628991;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=biH39H0HpRLKbVpGyTJ5g0fwQLM6TgEYucn6gZRMXrk=;
	b=GLuBPucj3BPPy836QOLH6AJAjJ0tBBbQUVdc5Bbtd3IZlUkKatDQp4IsyxOHO2N8N905Z3
	FoYBnKpTG3pBa6AA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CQiPNlnp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GLuBPucj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744628991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=biH39H0HpRLKbVpGyTJ5g0fwQLM6TgEYucn6gZRMXrk=;
	b=CQiPNlnpKHgX3OGervVPa2vbvRP2+7njM5WI35k7xZngxqJfCWyxsyZeLB3iC0asmBKhIM
	gQJsJlMDL96QTZuk4ZJeXKecZC9uyTAcbx9OTsHrv1G215X1meTfBkPRpn35SB47DQQjIq
	q33LZw1B4pXOT1oYiw2xDnqKQotWozI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744628991;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=biH39H0HpRLKbVpGyTJ5g0fwQLM6TgEYucn6gZRMXrk=;
	b=GLuBPucj3BPPy836QOLH6AJAjJ0tBBbQUVdc5Bbtd3IZlUkKatDQp4IsyxOHO2N8N905Z3
	FoYBnKpTG3pBa6AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1CEF01336F;
	Mon, 14 Apr 2025 11:09:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PdLDBf/s/GelUAAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 14 Apr 2025 11:09:51 +0000
Message-ID: <e1f2ac49-25f4-4b2c-b67c-10782b4e3455@suse.de>
Date: Mon, 14 Apr 2025 13:09:50 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patch "nvme: re-read ANA log page after ns scan completes"
 causing regression
To: "Aithal, Srikanth" <sraithal@amd.com>, hare@kernel.org
Cc: sagi@grimberg.me, hch@lst.de, kbusch@kernel.org, Ankit.Soni@amd.com,
 Vasant Hegde <vasant.hegde@amd.com>, open list
 <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>
References: <9a800759-b7f1-46dc-977c-7e39532ddec4@amd.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <9a800759-b7f1-46dc-977c-7e39532ddec4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4B65021229
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On 4/14/25 12:53, Aithal, Srikanth wrote:
> Hello,
> 
> With below patch in todays linux-next next-20250414 and v6.15-rc2 we are 
> seeing host boot issues. The host with nvme disk just hangs on boot.
> 
> If we revert this patch or disable CONFIG_NVME_MULTIPATH then host boots 
> fine.
> 
> commit 62baf70c327444338c34703c71aa8cc8e4189bd6
> Author: Hannes Reinecke <hare@kernel.org>
> Date:   Thu Apr 3 09:19:30 2025 +0200
> 
>      nvme: re-read ANA log page after ns scan completes
> 
>      When scanning for new namespaces we might have missed an ANA AEN.
> 
>      The NVMe base spec (NVMe Base Specification v2.1, Figure 151 
> 'Asynchonous
>      Event Information - Notice': Asymmetric Namespace Access Change) 
> states:
> 
>        A controller shall not send this even if an Attached Namespace
>        Attribute Changed asynchronous event [...] is sent for the same 
> event.
> 
>      so we need to re-read the ANA log page after we rescanned the 
> namespace
>      list to update the ANA states of the new namespaces.
> 
>      Signed-off-by: Hannes Reinecke <hare@kernel.org>
>      Reviewed-by: Keith Busch <kbusch@kernel.org>
>      Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> 
> Host console starts dumping a lot of errors and log size is more than 
> 100 MB. So I am not posting all logs here. I am pasting part of the logs 
> here:
> ...
> ...
> [   49.361223] nvme nvme0: controller is down; will reset: CSTS=0x3, 
> PCI_STATUS=0x1010
> [   49.434564] nvme0n1: I/O Cmd(0x2) @ LBA 0, 8 blocks, I/O Error (sct 
> 0x3 / sc 0x71)
> [   49.443123] I/O error, dev nvme0n1, sector 0 op 0x0:(READ) flags 
> 0x80700 phys_seg 1 prio class 0
> [   49.457080] nvme nvme0: Failed to get ANA log: -4
> [   49.506511] nvme nvme0: D3 entry latency set to 8 seconds
> [   49.536300] nvme nvme0: 32/0/0 default/read/poll queues
> [   49.605281] nvme 0000:41:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT 
> domain=0x0018 address=0x0 flags=0x0000]
> [   80.081190] nvme nvme0: controller is down; will reset: CSTS=0x3, 
> PCI_STATUS=0x1010
> [   80.154109] nvme0n1: I/O Cmd(0x2) @ LBA 128, 8 blocks, I/O Error (sct 
> 0x3 / sc 0x71)
> [   80.162864] I/O error, dev nvme0n1, sector 128 op 0x0:(READ) flags 
> 0x80700 phys_seg 1 prio class 0
> [   80.177032] nvme nvme0: Failed to get ANA log: -4
> [   80.225460] nvme nvme0: D3 entry latency set to 8 seconds
> [   80.255395] nvme nvme0: 32/0/0 default/read/poll queues
> [   80.301278] nvme 0000:41:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT 
> domain=0x0018 address=0x0 flags=0x0000]
> [  110.789207] nvme nvme0: controller is down; will reset: CSTS=0x3, 
> PCI_STATUS=0x1010
> [  110.861990] nvme0n1: I/O Cmd(0x2) @ LBA 2048, 8 blocks, I/O Error 
> (sct 0x3 / sc 0x71)
> [  110.870842] I/O error, dev nvme0n1, sector 2048 op 0x0:(READ) flags 
> 0x80700 phys_seg 1 prio class 0
> [  110.885040] nvme nvme0: Failed to get ANA log: -4
> [  110.933460] nvme nvme0: D3 entry latency set to 8 seconds
> [  110.963447] nvme nvme0: 32/0/0 default/read/poll queues
> [  111.009276] nvme 0000:41:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT 
> domain=0x0018 address=0x0 flags=0x0000]
> ...
> ...
> 
> 
Can you try this?

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 78963cab1f74..425c00b02f3e 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -4455,7 +4455,7 @@ static void nvme_scan_work(struct work_struct *work)
         if (test_bit(NVME_AER_NOTICE_NS_CHANGED, &ctrl->events))
                 nvme_queue_scan(ctrl);
  #if CONFIG_NVME_MULTIPATH
-       else
+       else if (ctrl->ana_log_buf)
                 /* Re-read the ANA log page to not miss updates */
                 queue_work(nvme_wq, &ctrl->ana_work);
  #endif

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

