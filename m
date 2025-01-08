Return-Path: <linux-next+bounces-5100-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9B9A0698D
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 00:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A87DA18859E5
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 23:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721EE2046AA;
	Wed,  8 Jan 2025 23:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F0oTw53F"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD2422611
	for <linux-next@vger.kernel.org>; Wed,  8 Jan 2025 23:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736379614; cv=none; b=Q6oDNu+DFCo12/uMY/RFeL1iFGe4+nlnROXN5AxRd2c1bUMX8Tmn386FOHsYZ6k8RCta+1pzfp7U4PKsz7oagBOMgYAfziImiDLjC/jfm3oCt0152DGonBTAdUsVBmjE9FPLSopA2Xnl2LOXgkSLbErYo0WboFZjFRQzueDt5q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736379614; c=relaxed/simple;
	bh=6MdkO+ANHM9A60tsmkecbfdrjtmSsD6weQX4DUCJNuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/kytDHkfBu2P/LRnGgh3/3Y165pQikDtCLyWykcGzk6+bX4d9Wgbu5KtgD3naHSbzob8/iWbFxdY3vdrfiN8o2GbRRtq1pAisHpFPArim9btw7V63l4AHDb+8uaY+P+azosR7XL2owDpwpno9cIQCbFTkkX1BmLfULeqZaIIaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F0oTw53F; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3ab29214f45so966465ab.0
        for <linux-next@vger.kernel.org>; Wed, 08 Jan 2025 15:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736379612; x=1736984412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Ri8mtVirUvyyZ6nmOnC/LZjhObjSlPKVdDOjjMdr2c=;
        b=F0oTw53Fn6BhcYe32Cl26yv7NTB+xwr/Tn6Wlw+dXXw4Yu1XtShmOVs5v5YnD1KQPU
         /Zw5xKnTC8jpEEbG2OItlLvTVeRICjHKktPXPsNkS4sDAHJ33DpYeGwEl0epNYEk/u01
         N1sJ55oLZg9Xshm+OZN5JgGfVfP940fBQWcXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736379612; x=1736984412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ri8mtVirUvyyZ6nmOnC/LZjhObjSlPKVdDOjjMdr2c=;
        b=iixf209uao2P1N6Y6T9QofGBhBCsx0GbzdMwUz7yGYdtIf8jxDttW3qm3lP8Jp39vk
         k2xZVGpAFbtdN817J+yECX9sTdcyB5ofYOx0FjPBjycJeZ6knlm9Z6PFXun9Ao2vyBda
         1+bWMFp/XH6Ym12qN60+r/TH+dmIZM3VwL+M0Sbw+r/6MsTlA726KNTdtMVCiR0mQmWB
         4OxPZh3Gc03YsqFnkppqwMo9GqTh0d6OH2PdCGToZ539skUtNTTlZPX0cWHf+5SnmL/3
         Jm+NRAe3bXYx4Pi6UDuvaVaBOKuvNpkkuqFnUEv3m2O91mLHLoGsZiU6xDXMGt0dfsPZ
         ts7A==
X-Forwarded-Encrypted: i=1; AJvYcCXx2zu4XFpQ8+UsltI8vQ6kGVzMDyeV1W8tGnh4DA/kyjcrxeR3MJqbUwRqPrw9UWp9cAw3w+0d+S9k@vger.kernel.org
X-Gm-Message-State: AOJu0YzE1+Km/Lqyj3ZSmZK3ayw6bSYMQTmsCEPL4+OpyW0VmBLYNUWK
	XLE6QtMRL6j2kuZ2HBjcZmirCiRJKpWGLDsTINriCX+WP5Xfh2xliy8Nr8s/WA4=
X-Gm-Gg: ASbGncsV6+wKaM5tfpPPWr39zzRkCUyu1f1nfz/YxWMKHJWJbIHtpyNe7gliFLhMW5+
	As0xT+u0iwPfHT9QRqVHV37a5csDyVRN9TJ+HrGGl0AhybiQ1xdS0iypoOnuhBS18rrQHh9ZV93
	Yp7evwoUvFdslkZEyXOF0sjvW/MGfISEucFkhyeavovxMJiOQSn/ipAsdpX9L3Ux6DXZakoES2U
	XEP86I+EYo6fImRavGWMnDoyZjlppSMZTks2tT9rYVGpZwrqDBTfieWzfk+gjOY7Mxe
X-Google-Smtp-Source: AGHT+IF6eYSuISgD+RCYfI+Ara0n1whGJDeBklXH6p//wxMXgzwItnvsMB1eg/4jHGvsuHgbZqdB3A==
X-Received: by 2002:a05:6e02:152d:b0:3a7:fe8c:b014 with SMTP id e9e14a558f8ab-3ce3aa763a6mr36286005ab.21.1736379611869;
        Wed, 08 Jan 2025 15:40:11 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ce4af56167sm398725ab.58.2025.01.08.15.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 15:40:11 -0800 (PST)
Message-ID: <057fdf09-ef2b-42fa-9300-dd7bf348362c@linuxfoundation.org>
Date: Wed, 8 Jan 2025 16:40:10 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the kselftest tree with the net-next
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Shuah Khan <shuah@kernel.org>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Laura Nao <laura.nao@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Willem de Bruijn <willemb@google.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20250108144003.67532649@canb.auug.org.au>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250108144003.67532649@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/25 20:40, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kselftest tree got a conflict in:
> 
>    tools/testing/selftests/kselftest/ktap_helpers.sh
> 
> between commit:
> 
>    912d6f669725 ("selftests/net: packetdrill: report benign debug flakes as xfail")
> 
> from the net-next tree and commit:
> 
>    279e9403c5bd ("selftests: Warn about skipped tests in result summary")
> 
> from the kselftest tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Thank you for finding this. I will mention this when I send pr to Linus.

thanks,
-- Shuah

