Return-Path: <linux-next+bounces-5423-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B8BA31FE4
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 08:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 865847A1B1E
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 07:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CF42040A7;
	Wed, 12 Feb 2025 07:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vourYyu9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MdokokWu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vourYyu9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MdokokWu"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC0B20126A;
	Wed, 12 Feb 2025 07:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739344949; cv=none; b=gywzBrR5pXAt/EnTBuzwGiWjlJOYxdtOzavjDXcZA7pXSo76Ugu0Koc2CUYTsDfpIUQNDRdHDPWEBKv4M8tiLqdrjxJjwnV37Gbt9f6/DuRx+Z42r704h9V+/QKlDjTwyWVbGJWf9La9SsM3629xwtxbmuZO8LUQGS1xhI+hrEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739344949; c=relaxed/simple;
	bh=DIOCditjXH0mxueBsvdyq/lQ7OxQXOinorT8U//mq1Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q/NdxQLYUOQgYJDru2QDuj/kiRBqnZLhbzHdckaChULUEf2nSW24vRDE5iGT7hLSoWIs5MDxNVTjDJWUDXUwNsx8bml/szkx9vPgbNW3uRZETTLI7L6axDmTBlJcliA8TzMMUNh4qqwOdLvoOczZ5r4MbrZhg7K8h8rUAHINKdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vourYyu9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MdokokWu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vourYyu9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MdokokWu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 696E53391A;
	Wed, 12 Feb 2025 07:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739344945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IRPrzwJ8bhh41e3YFtlm4L2IHQ/DHYrdmzK6wJBFlUs=;
	b=vourYyu9GXWhR+6Lrgk3yDeDGixUrp3csJTXeGY84vkzZWwaTUTxczZreXd+H63xW/XOBf
	eBEikAyHx9/7srq/mgRxSiD+J31MS3OxVmCkHCU1DgfotzVH9cpaXrAiQ/5qKSv0vMieYj
	+3hObfYZpyxxXMEDAZqNt78KKOCFA0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739344945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IRPrzwJ8bhh41e3YFtlm4L2IHQ/DHYrdmzK6wJBFlUs=;
	b=MdokokWuqV4MAgSLA6aMPY8zvS8xs9Ddl5jByiO/yf+hIB6CVMxYZKcHBEFFoqmNtLnuCR
	WtOkpXso/dnM5JDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739344945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IRPrzwJ8bhh41e3YFtlm4L2IHQ/DHYrdmzK6wJBFlUs=;
	b=vourYyu9GXWhR+6Lrgk3yDeDGixUrp3csJTXeGY84vkzZWwaTUTxczZreXd+H63xW/XOBf
	eBEikAyHx9/7srq/mgRxSiD+J31MS3OxVmCkHCU1DgfotzVH9cpaXrAiQ/5qKSv0vMieYj
	+3hObfYZpyxxXMEDAZqNt78KKOCFA0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739344945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IRPrzwJ8bhh41e3YFtlm4L2IHQ/DHYrdmzK6wJBFlUs=;
	b=MdokokWuqV4MAgSLA6aMPY8zvS8xs9Ddl5jByiO/yf+hIB6CVMxYZKcHBEFFoqmNtLnuCR
	WtOkpXso/dnM5JDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3E73613AEF;
	Wed, 12 Feb 2025 07:22:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9LXbDTFMrGeRGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Feb 2025 07:22:25 +0000
Date: Wed, 12 Feb 2025 08:22:24 +0100
Message-ID: <87ikpfmxu7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jack Livingood <jacklivingood@comcast.net>,
	Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sound tree
In-Reply-To: <20250212120927.40a4d24e@canb.auug.org.au>
References: <20250212120927.40a4d24e@canb.auug.org.au>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[comcast.net];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,comcast.net,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Wed, 12 Feb 2025 02:09:27 +0100,
Stephen Rothwell wrote:
> 
> Hi all,
> 
> After merging the sound tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> sound/firewire/isight.c: In function 'isight_probe':
> sound/firewire/isight.c:647:9: error: implicit declaration of function 'strspy'; did you mean 'strspn'? [-Wimplicit-function-declaration]
>   647 |         strspy(card->mixername, "iSight");
>       |         ^~~~~~
>       |         strspn
> 
> Caused by commit
> 
>   2a91231a78a7 ("ALSA: firewire: isight: changed strcpy to strscpy")
> 
> I have used the sound tree from next-20250210 for today.

Doh, I dropped the patch again.  Somehow my test bench didn't run well
yesterday.  Sorry for inconvenience!


Takashi

