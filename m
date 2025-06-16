Return-Path: <linux-next+bounces-7157-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8EFADA7D3
	for <lists+linux-next@lfdr.de>; Mon, 16 Jun 2025 07:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7583016BBFD
	for <lists+linux-next@lfdr.de>; Mon, 16 Jun 2025 05:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954701C6FFD;
	Mon, 16 Jun 2025 05:50:39 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3F1C2E11CF;
	Mon, 16 Jun 2025 05:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750053039; cv=none; b=rF2iVw52asvrrEhtBoalrJH9aqpXNIomHT2qGlIiaIB0r0svShaNytZVHkgGYFBv2TTFa364UlLY7WPPsPnxGO3/w2dMwpXrkiWMOhnjTX7SvPdbkuklbucMNpy4bK+HByi8DnF0bkQ+cA3V11X8Lf99ZNKM14JuSpZ4OcoWKUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750053039; c=relaxed/simple;
	bh=CJAd+aKM9Pfu6e0guSrEaR+0MN/mkaAyikHCoyUr4Rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=duIRcJ+FKvMH5HJoBfhMZwSl+tcQfPIIb3qegpE84y2HNc/XszOt4WZOlNY/2d2sZwOtVWrPbMjX0gxmsMFwI1cxoi5hy42nvvo6pUek0GuAgVDzgTwigyorSHSVJkgXqYHtvxTM4ScCGR9/f+q5sMKQK9wNmRN/rB1LECho5UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bLJVC6tLxz9st4;
	Mon, 16 Jun 2025 07:29:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FIWO7-Oem8zY; Mon, 16 Jun 2025 07:29:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bLJVC638Dz9sSD;
	Mon, 16 Jun 2025 07:29:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CDA7C8B764;
	Mon, 16 Jun 2025 07:29:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id UYBXJMCF-rVY; Mon, 16 Jun 2025 07:29:55 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 899E08B763;
	Mon, 16 Jun 2025 07:29:55 +0200 (CEST)
Message-ID: <20f5757c-78b3-4a68-a499-96951108d27c@csgroup.eu>
Date: Mon, 16 Jun 2025 07:29:55 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the sound tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Takashi Iwai <tiwai@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250616130126.08729b84@canb.auug.org.au>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250616130126.08729b84@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 16/06/2025 à 05:01, Stephen Rothwell a écrit :
> Hi all,
> 
> After merging the sound tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from include/linux/uaccess.h:12,
>                   from include/linux/sched/task.h:13,
>                   from include/linux/sched/signal.h:9,
>                   from include/linux/rcuwait.h:6,
>                   from include/linux/percpu-rwsem.h:7,
>                   from include/linux/fs.h:34,
>                   from include/linux/compat.h:17,
>                   from sound/core/pcm_native.c:7:
> sound/core/pcm_compat.c: In function 'snd_pcm_ioctl_sync_ptr_x32':
> sound/core/pcm_native.c:3081:60: error: 'struct snd_pcm_mmap_status_x32' has no member named 'tstamp'
>   3081 |         unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp.tv_sec, failed);             \
>        |                                                            ^

...

> 
> Caused by (sone of) commits
> 
>    2acd83beb4d3 ("ALSA: pcm: refactor copy from/to user in SNDRV_PCM_IOCTL_SYNC_PTR")
>    de32a6120b80 ("ALSA: pcm: Convert snd_pcm_sync_ptr() to user_access_begin/user_access_end()")
>    a0f3992ee86e ("ALSA: pcm: Replace [audio_]tstamp_[n]sec by struct __snd_timespec in struct snd_pcm_mmap_status32")
>    a9b49bf8ad59 ("ALSA: pcm: Convert SNDRV_PCM_IOCTL_SYNC_PTR to user_access_begin/user_access_end()")
> 
> I have used the sound tree from next-20250613 for today.
> 

This is caused by a0f3992ee86e.

Fix here : 
https://lore.kernel.org/linux-sound/e46139ed61bc52fab51babadb8b656fa1aa15506.1750050658.git.christophe.leroy@csgroup.eu/T/#u

Christophe

