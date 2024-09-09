Return-Path: <linux-next+bounces-3675-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5C997128C
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 10:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D6A81C224D2
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 08:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7771B150A;
	Mon,  9 Sep 2024 08:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="XpJ+mpXm";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="7fM56KsH";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="XpJ+mpXm";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="7fM56KsH"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24275176246;
	Mon,  9 Sep 2024 08:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725871790; cv=none; b=aj0+f8cfVyNKUhi6XB29m4LPDJYNBKBmlaJ0Wk82LfPd0KLe4anIgnfUTAVBMpuJn7yI8M4bxh7FkatAhmqMtAE2eh21iIHHVEAYSdg1fohfxNS0hziuQ22Lj0pAIEQaGzFcG7G11PchHd+6ym07R7H+akmuPAfZ+qYr67QodkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725871790; c=relaxed/simple;
	bh=DbqaKJRlXL1DpSh8bjDMesX0Ezvz1xIK9bEdC+bvCrM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Vjl/ckAXBBJV8jqpJiQzgNQOOuVCu3B8vSHMj2CC5GHeRp2gUagRyNrLy4yW+scT+NhELKXgpAnA1WMC3MhKQez8I287IZ9Ku4AXpNxqcmuHAIyHQ3jf6oUj51lP88IPnN6CL7/DpUeByVQQzwXzRE1iZj5h8QXtySS6ijLcXUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=XpJ+mpXm; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=7fM56KsH; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=XpJ+mpXm; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=7fM56KsH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0F1F421B7B;
	Mon,  9 Sep 2024 08:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1725871786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FjoMg4KYhwIcZpO28bIHE0OG92UWQxZDDiinqErxbc8=;
	b=XpJ+mpXmV31DRKl1fuf+YftelL2EfzDCAW+pcTpG37YOE0R0m900Ek7EQ+sPEzS93q7RPy
	wWeyN4qBVn+tjXllm2Ba8Jl+yurfhN4uzg3P2e+2Tesd3L3msCZ0q3+6VPYb80352zstdP
	luA0yttWubrJ9nHWtTUTRKv0VloUWSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1725871786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FjoMg4KYhwIcZpO28bIHE0OG92UWQxZDDiinqErxbc8=;
	b=7fM56KsHByUtBHkv4QkNqp4xeOvTvY89Vm6dBu4sL3TuQAyfXZmnAitv0mp7WoJL7RTjAr
	brXNskfc612tfpAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=XpJ+mpXm;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=7fM56KsH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1725871786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FjoMg4KYhwIcZpO28bIHE0OG92UWQxZDDiinqErxbc8=;
	b=XpJ+mpXmV31DRKl1fuf+YftelL2EfzDCAW+pcTpG37YOE0R0m900Ek7EQ+sPEzS93q7RPy
	wWeyN4qBVn+tjXllm2Ba8Jl+yurfhN4uzg3P2e+2Tesd3L3msCZ0q3+6VPYb80352zstdP
	luA0yttWubrJ9nHWtTUTRKv0VloUWSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1725871786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FjoMg4KYhwIcZpO28bIHE0OG92UWQxZDDiinqErxbc8=;
	b=7fM56KsHByUtBHkv4QkNqp4xeOvTvY89Vm6dBu4sL3TuQAyfXZmnAitv0mp7WoJL7RTjAr
	brXNskfc612tfpAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F307913A3A;
	Mon,  9 Sep 2024 08:49:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xWrvOqm23mYtdgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 09 Sep 2024 08:49:45 +0000
Message-ID: <c741cfbb-f209-4466-9d35-aef32dc3424f@suse.cz>
Date: Mon, 9 Sep 2024 10:49:45 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patches in the slab tree
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240909171220.32e862e3@canb.auug.org.au>
 <20240909181035.4ffd7434@canb.auug.org.au>
 <bde596e3-365b-4fdb-8a03-0a4e40a56246@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <bde596e3-365b-4fdb-8a03-0a4e40a56246@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0F1F421B7B
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On 9/9/24 10:32, Vlastimil Babka wrote:
> On 9/9/24 10:10, Stephen Rothwell wrote:
>> Hi all,
>> 
>> On Mon, 9 Sep 2024 17:12:20 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>> The following commits are also in the vfs-brauner tree as different
>>> commits (but the same patches):
>>> 
>>>   c0390d541128 ("fs: pack struct file")
>>>   ea566e18b4de ("fs: use kmem_cache_create_rcu()")
>>>   d345bd2e9834 ("mm: add kmem_cache_create_rcu()")
>>>   e446f18e98e8 ("mm: remove unused argument from create_cache()")
>>>   0f389adb4b80 ("mm: Removed @freeptr_offset to prevent doc warning")
>>> 
>>> These are commits
>>> 
>>>   f2b8943e64a8 ("fs: pack struct file")
>>>   d1e381aa30cb ("fs: use kmem_cache_create_rcu()")
>>>   ba8108d69e5b ("mm: add kmem_cache_create_rcu()")
>>>   a85ba9858175 ("mm: remove unused argument from create_cache()")
>>>   6e016babce7c ("mm: Removed @freeptr_offset to prevent doc warning")
>>> 
>>> in the vfs-brauner tree.
>>> 
>>> These duplicates are causing unnecessary comflicts ...
>> 
>> So, maybe my merge resolutions were not sufficient, because that then
>> failed to build (powerpc ppc64_defconfig):
>> 
>> mm/slab_common.c: In function 'create_cache':
>> mm/slab_common.c:238:13: error: 'freeptr_offset' undeclared (first use in this function); did you mean 'freeptr_t'?
>>   238 |         if (freeptr_offset != UINT_MAX &&
>>       |             ^~~~~~~~~~~~~~
>>       |             freeptr_t
>> mm/slab_common.c:238:13: note: each undeclared identifier is reported only once for each function it appears in
>> mm/slab_common.c: At top level:
>> mm/slab_common.c:389:20: warning: no previous prototype for 'kmem_cache_create_rcu' [-Wmissing-prototypes]
>>   389 | struct kmem_cache *kmem_cache_create_rcu(const char *name, unsigned int size,
>>       |                    ^~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c: In function 'kmem_cache_create_rcu':
>> mm/slab_common.c:393:16: error: implicit declaration of function 'do_kmem_cache_create_usercopy'; did you mean 'kmem_cache_create_usercopy'? [-Wimplicit-function-declaration]
>>   393 |         return do_kmem_cache_create_usercopy(name, size, freeptr_offset, 0,
>>       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>       |                kmem_cache_create_usercopy
>> mm/slab_common.c:393:16: error: returning 'int' from a function with return type 'struct kmem_cache *' makes pointer from integer without a cast [-Wint-conversion]
>>   393 |         return do_kmem_cache_create_usercopy(name, size, freeptr_offset, 0,
>>       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>   394 |                                              flags | SLAB_TYPESAFE_BY_RCU, 0, 0,
>>       |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>   395 |                                              NULL);
>>       |                                              ~~~~~
>> 
>> So I used the slab tree from next-20240906 for today in the hope that
>> the duplications will be taken care of and the whole things becomes
>> clearer.
> 
> I'm confused how did that help if slab tree didn't change since 20240906 and
> the commit ids meanwhile changed on the vfs side?

... so it would have to be either slab tree from 20240905 (before it
included the vfs commits), or vfs from 20240906 (before the commits on vfs
side got different id's).

I've noticed no diff (0f389adb4b80 vs 6e016babce7c) nor range-diff (from
v6.11-rc4 as a base) differences in the vfs tree before and after the id's
changed, so it seems that was not done intentionally? I'll wait whether
Christian decides to reset it back, before changing it on the slab side.

I guess if you rolled back vfs side in -next, then it makes more sense to
reset vfs, and if slab side, then slab.

