Return-Path: <linux-next+bounces-5652-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D84A4FAB9
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 10:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6ED1170B8A
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 09:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E029205E06;
	Wed,  5 Mar 2025 09:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZbuhRalR"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5773A205514
	for <linux-next@vger.kernel.org>; Wed,  5 Mar 2025 09:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741168434; cv=none; b=Ej6rAokx7C9PHC2Dh2/dd7+jHrEyMF5XZo4Kbl5j1cs6pewws8wQJ6goy4zDKO0PflGf0o+Gs1dsOlDfX3UjPvYqFvCVKFCoqJeta/wCknT5Cz4TyUDTNJ0rRugcKpAsgR392GWN9U64vLp06uwInpsoVRn12AhE/7P5Ob/qwUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741168434; c=relaxed/simple;
	bh=61itoehDo/+0AMvhVCNYYRR2REnhSzSWwlWLoqMvDto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F6mX6h/iaHOmxXSamrQw/prcGB99pQT+7PUAh2ms42NJ/Fdm1Yoj8RRbpTFHsmUo1ux2LBoQhBakcMiITQKJYnW1XCqhKl/KUABBGw605weE2ltRzwTWTMKOHc4Kq9arVdTNLWhnkWDa7vdrMTAuFrGBur+9CEesJhgHC3BnDbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZbuhRalR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741168431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KZUbRmh1B4qOIuBb44nafoTkzo3Y9FAH9V3whMAn34c=;
	b=ZbuhRalRCkB6YBRe2dQNQ3irtFeETguVeVXDvcYlA38vYcwvtQpmCk2mdEwOFddW/Ym/sU
	UAWW2bqKobj0KXyGFWwD/5Yxxwp/bBWn5wsdbfrvqm32uc2WP+yAEfpJVpBrCztyHaBihP
	2XFOqNrpPxznvGgfmtvKF0T46Jce1o8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-5nNEV4vCPxqfWjzdcbUCSQ-1; Wed, 05 Mar 2025 04:53:40 -0500
X-MC-Unique: 5nNEV4vCPxqfWjzdcbUCSQ-1
X-Mimecast-MFC-AGG-ID: 5nNEV4vCPxqfWjzdcbUCSQ_1741168419
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ab7f6f6cd96so774864266b.2
        for <linux-next@vger.kernel.org>; Wed, 05 Mar 2025 01:53:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741168419; x=1741773219;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KZUbRmh1B4qOIuBb44nafoTkzo3Y9FAH9V3whMAn34c=;
        b=O5NOhfQGBpXs01pBbB4PsS/fsMr8/oVPUpDgQ2VKBT2A0LYoQa6xFzSiMxT9SS5tr9
         YA/yTELrL2ixgKGlJgarWLV18TIc99NyBa97Kh5lNvraPR9jH2W2f7qYGTdpkYAgrJBY
         J/FtzEy2LkCA84OXtfJKLnoBuqkkM/sa9mnSCCQm+XyeU4brlx8/tqRFdG0/qk8x+leI
         7efHyFk+S008rlKOGqgq7G2icYj1W1TIFVXbuIkcHqu5s2ubPzpAIR1TKyWmx3LUBNbn
         do1csvoe6qTncMD/mkPiz3FdM3g63kcVtF6nVz+j9NFQ6tn3Kc8f2LuOvzU0zQz93r3o
         PxHw==
X-Forwarded-Encrypted: i=1; AJvYcCXpMhEDPJ/f7PiW96ebrM3X3zmwAsOegB2X3yRe2k/x5rEP3xJolB0bA5FsJognVD24QWdk3FcGWQaa@vger.kernel.org
X-Gm-Message-State: AOJu0YxHLCk5zTloU+jcXgp5Fpa4OpsIyjl3yC8QIBDLggGprnysgL2C
	mq0b9uJ+aFREkJm8A9aN52d5EH/Spgc4Tfmu3h+fkD2tpowvsQC1cJypEVjhEpQSnDTx72TcrZk
	/RbKt7bnwtrZMsvY2pVj1Yr/+jQZwr/hqUdq0YmMzkH2+QM8444IDvcN7hmM=
X-Gm-Gg: ASbGncuMuDRnlal/FsEzgF7BWgfDV25lPfST5AoVgfZrkmLeIzqEHvpn6C1jzU6Jcq4
	bOnmONn5l0vpkbjduyshgI3SCmadX0IISBFZh3X8UadYlBEf+rs1rCHXaN8lXu1f2gp6NNdnMgo
	RiE7/Y4JAm+J0EEhAQvEruHM7yVBf/ihOxY6z9QWZ/3IDF049q+f7af/RCWDGpZ4JbpjYk/Z9TF
	c82gyNtCjm+iFj2at8biW/+xx08wEwsF4hgekVyavRGuBj0a84TJbdhHmJF1QGCohosDBNjniH+
	Crj/UdZekICgT4T3aLhj//UvtNXM45eHosQl+3P4nn++blxXbQ==
X-Received: by 2002:a17:907:9628:b0:ac1:f002:d85d with SMTP id a640c23a62f3a-ac20da4267fmr225772666b.6.1741168419164;
        Wed, 05 Mar 2025 01:53:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4fThcJunLaYFnyAZ4NBO3mfl6nINuYRG54xpBa6CGqbfms1JCJEFzRseCiwKWwERlTipSKw==
X-Received: by 2002:a17:907:9628:b0:ac1:f002:d85d with SMTP id a640c23a62f3a-ac20da4267fmr225771166b.6.1741168418744;
        Wed, 05 Mar 2025 01:53:38 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf5d0bcb77sm677668066b.49.2025.03.05.01.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 01:53:38 -0800 (PST)
Message-ID: <016b7cb8-451c-4d81-b3c2-e98fa0bc330a@redhat.com>
Date: Wed, 5 Mar 2025 10:53:37 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warnings after merge of the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250305204243.0458b36e@canb.auug.org.au>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250305204243.0458b36e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.03.25 10:42, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm tree, today's linux-next build (htmldocs) produced
> these warnings:
> 
> include/linux/mm_types.h:482: warning: Function parameter or struct member '_usable_1' not described in 'folio'
> include/linux/mm_types.h:482: warning: Function parameter or struct member '_mapcount_1' not described in 'folio'
> include/linux/mm_types.h:482: warning: Function parameter or struct member '_refcount_1' not described in 'folio'
> 
> Introduced by commit
> 
>    bbde3b621cf7 ("mm: let _folio_nr_pages overlay memcg_data in first tail page")
> 
> from the mm-unstable branch of the mm tree.

Hm, we also don't document other dummy placeholders like:

* _flags_1
* _head_1
* __page_1

So I assume there must be one way to silence these warnings, let me dig ...

-- 
Cheers,

David / dhildenb


