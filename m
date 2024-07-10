Return-Path: <linux-next+bounces-2924-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FC792CC7E
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 10:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1687285563
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 08:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D80682C60;
	Wed, 10 Jul 2024 08:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gm9xrbMT"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04D47EF09
	for <linux-next@vger.kernel.org>; Wed, 10 Jul 2024 08:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720598853; cv=none; b=ea7Wu/ABf9Hn7f3AmD7Tn8NWiE0rp/eGmwN9Y18Lp5nxYjr1pif8F51vYwhVzMZpnZ6X8g12Wy5Zz8aYnn9Xt7b73Ba4jEjU1+9cDq32Qs3kXsA9ofg/dBszTLJhzvZAb+Ufgb5gsePCMy26XEXUDpniI96A6o0X5ByerRsBeEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720598853; c=relaxed/simple;
	bh=FEbhogfEsTLrTHCnY7TKXRwi70W1BNgYKcv0tvCujYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TKb9ZJGNkGJ/So1bbHsnsWowopIj0EkJ6DkHj1asjTv7OF+b57bqE31rBgXM0NbfWWhZ/tIdtSrw58A0KjDJIwfSmUIoltsKXms9IojvxlBx4VEQAw2SdhFd3JwZdqpgk69eQM/EP0xi4ioFk49UnKOGD+9PlCqPaQr4SMwZDHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gm9xrbMT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720598850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xHQwFNbnE9Dxnhgjr9tW3YFKUmm3yw0j9yYTKxOwX9o=;
	b=gm9xrbMTTIzmkmbai9G6F1+hlAV4m0TJdtRbdBdrRUGJMdxjul0nCM6j9fMJei2UkywWmr
	RULbt119WDFEQByURxFQilcFh1xcAmZgstanJn0pUWFbWmdZO1uvYoYrKgeEOhqNM5oJ6M
	t7gJuq4SadqXb9xt0tK4HUhLrXBv1AI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-p0VGThdZPgCM28C5HF_C2Q-1; Wed, 10 Jul 2024 04:07:27 -0400
X-MC-Unique: p0VGThdZPgCM28C5HF_C2Q-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a6f571c3eefso362735066b.2
        for <linux-next@vger.kernel.org>; Wed, 10 Jul 2024 01:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720598845; x=1721203645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xHQwFNbnE9Dxnhgjr9tW3YFKUmm3yw0j9yYTKxOwX9o=;
        b=wwF2BMfZ+GefOhCK4G/MLsYT0PWNZEebIMFJZnLpJbWnfSh54CYG6mkplL7NdAxPoV
         z39m9rpDjHA2cfWUYJqsh/vrL0WhU1C/4mLdYjZTswQUQRALkoiHxQaa4T6Aj7WcWInk
         kZmETmWr2yW9mKEozo0rLchjbQ6xsWF7VJBkYSocxz1n2uv3g9FsdokyEIGiSjEgrQax
         qdfWNbq7ZQNbXCgip4PnnIP3byTEIhPSWODmyjISo+B28Qk+bVz8eAV0XrMpFvHu5rRX
         /BfkVKYoEHjQsn5FoUZk+YZVBxT4dBY5t8mV+rgyhvfGtV78zxneHBV5p9hNOHjqcxen
         2I6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX93u/dRhCGmXV6SQBoYxF/ohIMmwdM/e9afO5tOTalX+wDoHC4HlpdgseEP6hURUAlU8jme3eUr5c5QGta9LDiqEICOo+UFPj0Pw==
X-Gm-Message-State: AOJu0YzQtFiWmxtodbSSzEQcbLo2m8ybVV/N5Qyp1KXHN/ceV2Si6kK/
	rvl6qWvGWd2Ob8FBtf4xiz5pMb50GkmEz5L9t/WlQLXjlxRsBDCyVNLIzMQYr15qtkMoc3zYSJZ
	BO1XIt8nWx7PtzxWNhhgP/cTxH/EKLE4YS9PVLp3yW4gR0yuPn/VlRL3knco=
X-Received: by 2002:a17:907:94c5:b0:a72:6b08:ab24 with SMTP id a640c23a62f3a-a780b68a964mr413231666b.14.1720598845219;
        Wed, 10 Jul 2024 01:07:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf6dDTxwRNAfEJlHRXGRVbYJBGXexlxoaf8Tl0dNFnxms69TgHGlHeV0ZlKFpr+tIVRwc1uw==
X-Received: by 2002:a17:907:94c5:b0:a72:6b08:ab24 with SMTP id a640c23a62f3a-a780b68a964mr413229466b.14.1720598844877;
        Wed, 10 Jul 2024 01:07:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a855eb9sm136530466b.151.2024.07.10.01.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 01:07:24 -0700 (PDT)
Message-ID: <66a6aa98-009f-42c5-84dc-4c763d484472@redhat.com>
Date: Wed, 10 Jul 2024 10:07:23 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the battery tree with the leds-lj
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
References: <20240709133420.55645c59@canb.auug.org.au>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240709133420.55645c59@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Stephen,

On 7/9/24 5:34 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the battery tree got a conflict in:
> 
>   include/linux/leds.h
> 
> between commit:
> 
>   6b0d3355e5a5 ("leds: class: Add flag to avoid automatic renaming of LED devices")
> 
> from the leds-lj tree and commit:
> 
>   5607ca92e627 ("leds: core: Add led_mc_set_brightness() function")
> 
> from the battery tree.
> 
> I assume that the bit number valuse don;t actually matter, right?

Correct, which bit is used for which flag does not matter.

> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thank you.

Regards,

Hans



