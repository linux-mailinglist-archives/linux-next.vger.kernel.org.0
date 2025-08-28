Return-Path: <linux-next+bounces-8135-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB34B3A37B
	for <lists+linux-next@lfdr.de>; Thu, 28 Aug 2025 17:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A156320785F
	for <lists+linux-next@lfdr.de>; Thu, 28 Aug 2025 15:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8763C313E27;
	Thu, 28 Aug 2025 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="3dLQzOV5";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="sXq5Ef3r";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="3dLQzOV5";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="sXq5Ef3r"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6712B264630
	for <linux-next@vger.kernel.org>; Thu, 28 Aug 2025 15:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756393214; cv=none; b=OI5EVVSH9BxaT6fGFMNuFmAyb2ljosL67mB5Wk3Bi8JcmmTVBJgQ8oS5FYaHj7MsrPqrbNpRvFH3TiHIkWh3iT1z1fPBh7hmwN+2rCejd3pWn5UrZ0LJ54JZuDtiXVOk/Mc4Hfm6NPRWR8HNnp4pGQWGKxhW1TiXtwj5DVEtL14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756393214; c=relaxed/simple;
	bh=zA0cDuItVocYyxoIesjuMV1OW2nMWmCT4Z1pPjFCdlo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=t/bfE7OYHL9+8OS8Bwi5/Y5zpHODEAmjKuPKdmAVQwa57YrwwP/tAjN+wRagtYwlneeAxouRJz04M1FVADaNvCcdHXpd/G6Zyn2aCqPXDYNa9tYu3GstLPDHJnfNv2b7hmyl4Kh2SknS29pGbLq9ed/uWo9dr0VT4hY/hqbFdNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=3dLQzOV5; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=sXq5Ef3r; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=3dLQzOV5; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=sXq5Ef3r; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6572920C9C;
	Thu, 28 Aug 2025 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1756393210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uehZBsnaehY6HkqRyNwn4pp7E8jo40zKq9Usa7eHFPA=;
	b=3dLQzOV5Io6C5tPZOdOG3wR15ww76bjkjbM/0Up/TSrbuHvOUCjbRB9AnP4lJMIjtPH+bU
	+mftrfiJUCIdzNEfFkFaPuy2+2/1rBlaP6mov1HdDo2QxAzYufJtxUVaBgswmuf9vPaChL
	+ENxHdQCKQP91fKHKifx9gV8nTLIx1Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1756393210;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uehZBsnaehY6HkqRyNwn4pp7E8jo40zKq9Usa7eHFPA=;
	b=sXq5Ef3rTT3VN6DIqFdFbm/VTT0r+H3U2M28wHwQDsmI8+Kb86rcVNl9zJSVroJlmch5nC
	tDtrERN/ih8nMbBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1756393210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uehZBsnaehY6HkqRyNwn4pp7E8jo40zKq9Usa7eHFPA=;
	b=3dLQzOV5Io6C5tPZOdOG3wR15ww76bjkjbM/0Up/TSrbuHvOUCjbRB9AnP4lJMIjtPH+bU
	+mftrfiJUCIdzNEfFkFaPuy2+2/1rBlaP6mov1HdDo2QxAzYufJtxUVaBgswmuf9vPaChL
	+ENxHdQCKQP91fKHKifx9gV8nTLIx1Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1756393210;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uehZBsnaehY6HkqRyNwn4pp7E8jo40zKq9Usa7eHFPA=;
	b=sXq5Ef3rTT3VN6DIqFdFbm/VTT0r+H3U2M28wHwQDsmI8+Kb86rcVNl9zJSVroJlmch5nC
	tDtrERN/ih8nMbBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 307FC13326;
	Thu, 28 Aug 2025 15:00:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id A0FdC/pusGjVLAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 28 Aug 2025 15:00:10 +0000
Message-ID: <9705a0d1-0108-4f63-9a5c-9ca6c20eeb32@suse.cz>
Date: Thu, 28 Aug 2025 17:00:09 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/10] slab: add opt-in caching layer of percpu sheaves
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
To: Thorsten Leemhuis <linux@leemhuis.info>,
 Suren Baghdasaryan <surenb@google.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
 Harry Yoo <harry.yoo@oracle.com>, Uladzislau Rezki <urezki@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 maple-tree@lists.infradead.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Bert Karwatzki <spasswolf@web.de>
References: <20250827-slub-percpu-caches-v6-0-f0f775a3f73f@suse.cz>
 <20250827-slub-percpu-caches-v6-2-f0f775a3f73f@suse.cz>
 <9f61c814-0d39-46f2-a540-cc9c0e716cf6@leemhuis.info>
 <e58c8482-bd11-4111-b912-daf8b43ebb15@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <e58c8482-bd11-4111-b912-daf8b43ebb15@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,web.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,oracle.com,gmail.com,kvack.org,vger.kernel.org,lists.infradead.org,canb.auug.org.au,linutronix.de,web.de];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.80

On 8/28/25 10:01, Vlastimil Babka wrote:
> On 8/28/25 09:43, Thorsten Leemhuis wrote:
>> On 27.08.25 10:26, Vlastimil Babka wrote:
>>> Specifying a non-zero value for a new struct kmem_cache_args field
>>> sheaf_capacity will setup a caching layer of percpu arrays called
>>> sheaves of given capacity for the created cache.
>>> 
>>> Allocations from the cache will allocate via the percpu sheaves (main or
>>> spare) as long as they have no NUMA node preference. Frees will also
>>> put the object back into one of the sheaves.
>>> [...]
>> 
>> This patch showed up in linux-next today and from a *quick* glance at
>> things I suspect it might be the reason why my daily next rpm builds for
>> Fedora failed today like this:
> 
> Hi, thanks for the report.
>> ""
>> In file included from ./include/linux/spinlock.h:63,
>>                  from ./include/linux/mmzone.h:8,
>>                  from ./include/linux/gfp.h:7,
>>                  from ./include/linux/mm.h:7,
>>                  from mm/slub.c:13:
>> mm/slub.c: In function ‘__pcs_replace_empty_main’:
>> mm/slub.c:4727:64: error: ‘local_trylock_t’ {aka ‘__seg_gs struct spinlock’} has no member named ‘llock’; did you mean ‘lock’?
>>  4727 |         lockdep_assert_held(this_cpu_ptr(&s->cpu_sheaves->lock.llock));
>>       |                                                                ^~~~~
>> ./include/linux/lockdep.h:392:61: note: in definition of macro ‘lockdep_assert_held’
>>   392 | #define lockdep_assert_held(l)                  do { (void)(l); } while (0)
>>       |                                                             ^
>> [...]
>> mm/slub.c:5653:29: note: in expansion of macro ‘this_cpu_ptr’
>>  5653 |         lockdep_assert_held(this_cpu_ptr(&s->cpu_sheaves->lock.llock));
>>       |                             ^~~~~~~~~~~~
>> make[3]: *** [scripts/Makefile.build:287: mm/slub.o] Error 1
>> make[2]: *** [scripts/Makefile.build:556: mm] Error 2
>> make[2]: *** Waiting for unfinished jobs....
>> make[1]: *** [/builddir/build/BUILD/kernel-6.17.0-build/kernel-next-20250828/linux-6.17.0-0.0.next.20250828.432.vanilla.fc44.x86_64/Makefile:2017: .] Error 2
>> make: *** [Makefile:256: __sub-make] Error 2
>> ""
>> 
>> Full log: https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/fedora-rawhide-x86_64/09498568-next-next-all/builder-live.log.gz
> 
> Oh so I assume the .config here has both LOCKDEP and PREEMPT_RT?
> I tried to make lockdep_assert_held() with trylock but forgot about the RT
> difference. The solution is Alexei's patch
> 
> https://lore.kernel.org/all/20250718021646.73353-2-
> alexei.starovoitov@gmail.com/
> 
> Wonder if I can just fast-track it to here from that series?

Did that for tomorrow's -next

