Return-Path: <linux-next+bounces-5330-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E042DA1D2DB
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 10:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F493188A5AB
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 09:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425E81FCFC1;
	Mon, 27 Jan 2025 09:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="H3cx5GJ8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E7A1FCD16
	for <linux-next@vger.kernel.org>; Mon, 27 Jan 2025 09:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737968549; cv=none; b=WVU+cBHGFjMYP8at8TYHeQlQc85q3P5JqZ/rat5kxoZ6CG+iGUQIQWw5gcqyzaZymJlx6f7/LwaMNK6y8bg/j/dLq6mhaOG1xP9gucF2D/NvhiAbSkC6hj2DOT4CvGVs1AFSkhu074iih0BGDd7ZZDrwNGmjl6dIool947fYNkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737968549; c=relaxed/simple;
	bh=zP/eidqcm7S4OLZwmzb0Qyv72qB5DTGTb80n50LNnyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXVtiwNOnPmyVqzz4yMenb9SJDeUQ2Y9mwrLwZ2OVm9m9VJ3sfxvapBCBxSsF34BJXAaRTXvLO8AaJCLF1SDIvC0Z1H5XP1Ay94OPjF+d3dLRMKzzriBa8ZDiHuj6xVHQUZs+8gf4ICjUdhzRfldFitMgyeU9W2vdNcQSqkGAIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=H3cx5GJ8; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so4351458f8f.1
        for <linux-next@vger.kernel.org>; Mon, 27 Jan 2025 01:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737968545; x=1738573345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cPxWsqye1HO+VOeAbE2kY6oaeiIg8DsKeDs/TGghUKU=;
        b=H3cx5GJ8AWCWeMO85wYYVVprcDEnjmbZgAX6X5tI5+BOM2yFTZUSARa9VrDzmhOH6P
         JE1x55n74eWFBYfGP+rh00oxhGk3Yk182R22QZlReeNM5JkvXfqpqI7FIZphebVkMm9F
         tzt1WIiJ50U8gPv8gIquiFhQjWc2mUawqOFCwelSs63JUmlwbZv9L17UfJaAKGOcIlVs
         84Wrml/rODTo0NfmGm8JE56KW5wIAhwtDbUSJqtagO2Wh5E3lTHQjtg8/PA2DsvcW8s4
         3AgLmKW2uldT0diBNiW1KG2JwrClo92o/LmMhruPtROJesCSjjsMpBDf7XhykOmAuboj
         ZM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737968545; x=1738573345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cPxWsqye1HO+VOeAbE2kY6oaeiIg8DsKeDs/TGghUKU=;
        b=Nr8cmbzsRk69GTFe1lxrooo7SowkUhJyk2VEb31AwEuVKaOfVrb02DIKd1hslIatrl
         bmLnhiW7DSkOIFeL8xcrhcob1BW1fqY9XRP3ijtg/6CwcwSNcBizIZKEDWAJ4eInTB6A
         2p0/Z7M9yXaAJEd5el+DUQDoivizQa4gMTiLtTBcHJG27oon6iy4gctsH3OvQW3Q+DDC
         ldSf5ixEP8BzIUl46FX7VmsT7br01SYo3dmuD5WGwcECDzFDD8riWjcj8wbUZt/9Uo2F
         aoOIDpAvHm3ILVERSjkVIR1ku3ue8wdOsjdrmx5KejwCjPYH9G5W4nQeSaZK4dwg22iJ
         Dkow==
X-Forwarded-Encrypted: i=1; AJvYcCU5JXrUAHTmCjTlg7nJ5Nlu+YQ/tAVv0XK7FDn2iLo8BeHoSpKs3BdOFADlyhq4MLDT5RY5PLSwl8zG@vger.kernel.org
X-Gm-Message-State: AOJu0YwPWlOYMSzFzyww8O3pnKJqE2gjOmiG/LQKqBoxuE7vi9eqa2b6
	Go7biZkV/Xrxsldr2hlrMVLZbLgHreavla6susp7ee3l4UXLqXUdSCmDpR1MV1w=
X-Gm-Gg: ASbGncuFUl3qkAneKk29Qr8+j5YDU65DZxM3TlWt5r7wur5pr3IXqyljsc12WZt4NMI
	e6uIs/eu4KRfMdm8QCl33vcOqut/rAe1M4PzypsCHtxYVXNIYYLOKPgF055rSAADAB12Haw8/in
	64OdmV3wyTZO5R+NFabyWYGdL8Oja2UQf/+BZ0f66s0YUjQz2GXbjA83rYC8rgdohZIoIrEyoe0
	hxIM5vv9eHPUOMw9dA/FB5DeYxlp41DhQDTSGfZpkWppl20/iwDD5Vk1sCdx+uRZ4Bj6lwb7CKW
	5rQIovtO
X-Google-Smtp-Source: AGHT+IF4dUFACjTPsJZqNFS4bql7jr+mUpl5lfhJbxsxG31o8QMsTAJbn+JdO6g5MRvuSNqR9P+xqw==
X-Received: by 2002:a05:6000:4008:b0:385:df2c:91b5 with SMTP id ffacd0b85a97d-38bf55bebd7mr36275333f8f.0.1737968545167;
        Mon, 27 Jan 2025 01:02:25 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188bf5sm10596744f8f.50.2025.01.27.01.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 01:02:24 -0800 (PST)
Message-ID: <8fcc8318-2d90-485d-acdd-196bda95cd6a@suse.com>
Date: Mon, 27 Jan 2025 10:02:23 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patches in the modules tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250127135935.0195bc68@canb.auug.org.au>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250127135935.0195bc68@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/27/25 03:59, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
> 
>   0217859ce172 ("module: sign with sha512 instead of sha1 by default")
>   0dea980a17a3 ("module: sysfs: Drop member 'module_sect_attrs::nsections'")
>   0e436d14d0b9 ("module: Put known GPL offenders in an array")
>   25aa76116052 ("module: Constify 'struct module_attribute'")
>   570f7776db9c ("module: Split module_enable_rodata_ro()")
>   75b519abc918 ("module: sysfs: Simplify section attribute allocation")
>   8c82fb5240f7 ("module: Extend the preempt disabled section in dereference_symbol_descriptor().")
>   993026197341 ("params: Prepare for 'const struct module_attribute *'")
>   9b894ee43337 ("module: Don't fail module loading when setting ro_after_init section RO failed")
>   c027a83a0375 ("module: sysfs: Drop member 'module_sect_attr::address'")
>   cb80af8451df ("module: Handle 'struct module_version_attribute' as const")
>   cd8026d4bda8 ("module: sysfs: Drop 'struct module_sect_attr'")
>   e6ea40687ff0 ("module: sysfs: Use const 'struct bin_attribute'")
>   fc15d675bc49 ("module: sysfs: Add notes attributes through attribute_group")
> 
> Presumably rebased before asking Linus to merge them :-(

Right, I rebased modules-next locally, pushed a tag for a pull request
which has been merged, but I forgot to push the actual branch. Sorry
about that, it should be fixed now.

I could have arguably saved myself time and trouble by not rebasing
modules-next in this case, which might have been also better from
a testing perspective.

-- 
Thanks,
Petr

