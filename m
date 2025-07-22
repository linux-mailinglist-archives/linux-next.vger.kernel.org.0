Return-Path: <linux-next+bounces-7684-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E62DDB0D4B2
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 10:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C06F91895B02
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 08:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F56D2D3EFA;
	Tue, 22 Jul 2025 08:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="HhlxpS42";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9fZNr1pA";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="HhlxpS42";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9fZNr1pA"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C942C158F
	for <linux-next@vger.kernel.org>; Tue, 22 Jul 2025 08:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753173055; cv=none; b=cGYaYvFSmQLPuxO7ae3conK5aGgKs99cvibqCqiHaIONQ9bXEH7EnnozcDCZVA2wiU2z4Wie88gHqZXKlE6ZUa+zfZy+Hm5iJEHXH36aQiuDAoyOyeLGDFPeUk1hXOWEl/CgGVNjASMnyGrmoNveH+9x2t+hacCY/ZfCcIs9uOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753173055; c=relaxed/simple;
	bh=nuMrp4FEiuu3MP7bNP6Sa2dcUb0guT+ZuN70gdGDV7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZfabRuHhr9Vex5xaJPqNE+6g6MSe8Vhskr22Lqcrr2hUBDcZpwpph2dbEhtVZCRSp5r/2At1Cwq2CKU+ExUBoFOGJFwdKsoa3TbdKbexKgg/zLesMonYvJCGOBB9Z5OJzDoTfnHGha9qSuT7L7XcRxUnIMmcsAhgETs1jSfZcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=HhlxpS42; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9fZNr1pA; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=HhlxpS42; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9fZNr1pA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9B36D1FB3E;
	Tue, 22 Jul 2025 08:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1753173045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=i0fdf9kvnx2xDWK8fxogdC6MbmVtc5r9ZvknpyoLGxQ=;
	b=HhlxpS426F2IiCn7NI9GByqcRHgXvWi1C4sqMawxxC6puz0UnSotm72eoKB/9No+8IEPjp
	LgvGA4PfvItwCJMjMxi30M8fU9Y8EgVqnGg8CUV/xJE/WrP/i78eZwDgmhQxGJanK/22oo
	bmw3uPNr6HOOniSV47XbGVFhcFPH5nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1753173045;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=i0fdf9kvnx2xDWK8fxogdC6MbmVtc5r9ZvknpyoLGxQ=;
	b=9fZNr1pAnR/+eLNiqQXUkCfFhEFpvChNsDhkcI1oKIxIFrBvPi2Aa1yRzZw9ibHRdST3it
	DqI+wM6GoZyXpJAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1753173045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=i0fdf9kvnx2xDWK8fxogdC6MbmVtc5r9ZvknpyoLGxQ=;
	b=HhlxpS426F2IiCn7NI9GByqcRHgXvWi1C4sqMawxxC6puz0UnSotm72eoKB/9No+8IEPjp
	LgvGA4PfvItwCJMjMxi30M8fU9Y8EgVqnGg8CUV/xJE/WrP/i78eZwDgmhQxGJanK/22oo
	bmw3uPNr6HOOniSV47XbGVFhcFPH5nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1753173045;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=i0fdf9kvnx2xDWK8fxogdC6MbmVtc5r9ZvknpyoLGxQ=;
	b=9fZNr1pAnR/+eLNiqQXUkCfFhEFpvChNsDhkcI1oKIxIFrBvPi2Aa1yRzZw9ibHRdST3it
	DqI+wM6GoZyXpJAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 895F7132EA;
	Tue, 22 Jul 2025 08:30:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5hUfITVMf2jQDwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 22 Jul 2025 08:30:45 +0000
Message-ID: <4fe82763-09ec-4b3c-bfda-5997c55996a9@suse.cz>
Date: Tue, 22 Jul 2025 10:30:45 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the slab tree with the mm-unstable
 tree
To: Luiz Capitulino <luizcap@redhat.com>, Matthew Wilcox
 <willy@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>
References: <20250721142001.3d1c8777@canb.auug.org.au>
 <aH6XIUX4xyo2pZfY@casper.infradead.org>
 <954b5aa4-0dbd-445f-8859-320fb6a1186d@redhat.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <954b5aa4-0dbd-445f-8859-320fb6a1186d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -4.30

On 7/21/25 23:35, Luiz Capitulino wrote:
> On 2025-07-21 15:38, Matthew Wilcox wrote:
>> On Mon, Jul 21, 2025 at 02:20:01PM +1000, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Today's linux-next merge of the slab tree got a conflict in:
>>>
>>>    fs/proc/page.c
>>>
>>> between commit:
>>>
>>>    a602ee331e31 ("fs: stable_page_flags(): use snapshot_page()")
>>>
>>> from the mm-unstable tree and commit:
>>>
>>>    d8178294c53e ("proc: Remove mention of PG_slab")
>>>
>>> from the slab tree.
>>>
>>> I fixed it up (I just used the former version) and can carry the fix as
>>> necessary. This is now fixed as far as linux-next is concerned, but any
>> 
>> I think the snapshot_page commit was incorrect in removing this comment.
>> It is still valuable information.  I think the comment from d8178294c53e
>> should remain in the tree after the resolution.
> 
> The comment wasn't just dropped, David suggested a new version for the comment
> (which is similar to yours). The new comment is now part of set_ps_flags()
> which is where we set this flag in the snapshot_page() implementation:
> 
> static void set_ps_flags(struct page_snapshot *ps, const struct folio *folio,
>                           const struct page *page)
> {
>          /*
>           * Only the first page of a high-order buddy page has PageBuddy() set.
>           * So we have to check manually whether this page is part of a high-
>           * order buddy page.
>           */
>          if (PageBuddy(page))
>                  ps->flags |= PAGE_SNAPSHOT_PG_BUDDY;

That seems to work. I can therefore simply drop d8178294c53e from the slab tree.

>          else if (page_count(page) == 0 && is_free_buddy_page(page))
>                  ps->flags |= PAGE_SNAPSHOT_PG_BUDDY;
> 
>          if (folio_test_idle(folio))
>                  ps->flags |= PAGE_SNAPSHOT_PG_IDLE;
> }
> 


