Return-Path: <linux-next+bounces-6527-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DF6AA97AE
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 17:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FE7518986D5
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 15:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F42B25DD11;
	Mon,  5 May 2025 15:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HP7Z397R"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C8D1DFF7
	for <linux-next@vger.kernel.org>; Mon,  5 May 2025 15:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746459793; cv=none; b=YNrs6RNu1jTVf5e6by3JW6NEkiecmuZ1uOVClcYvXvbkT6aS7mu/p/kCzzjeJm8NQ/7okJCAsiJrt99jOvzMDl9E9mQ/WTdsHOKiO3B8SSidhC/+rpHXfie0JdbHnpmD953B3tTsfP+DDneh3NyWqNjoJBAPuaPhN9MxKd22hPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746459793; c=relaxed/simple;
	bh=QRTbxv6zAHeMDzXhqL8aw35yYIDNThc5twhBqvEaco4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ugiqqtc7ptqg05df32k0rs6QG5ftVhD6P+8Z1GnXbJosEwty456FwqRuYaKmDro7YGlBZlXGgTYeTsJB0O4bt4nJDqTe+vpWdUpb2WIoaar05xD5cMpXXwoGJNBgwd68NREb9eWWo28xzSi26zWL9GMipzNl1/+a3S7lUZX5ibg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HP7Z397R; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-605ff8aa9d2so1135034eaf.0
        for <linux-next@vger.kernel.org>; Mon, 05 May 2025 08:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746459790; x=1747064590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jADEHGiMlecVFngKrds8KPNTRKyJX4Rr2PqMnmh5p04=;
        b=HP7Z397RXibyRH45OVZiWscWZnLDnQIKIkOEAj86AHCkuMW8RT1kxo360dsr1bcdOg
         udG2Bv+vZHR6yaMcwOUavh174fAv7bbYH5gYOBu/CLnyyv4J3nWkgDK+VyRtuXaoPW2A
         5lSVIqrod4kVYyR9jBeywUqmqez/ULw8UXXBTIthF60acb6lFRvFPDlnnMCwF00wM9nY
         X7jrOK4TMBpsELHthudUtJzrZ7SaY/qd3CooyIEQrp485JS+Jquj3P7TrHIQv4lxosww
         y0Y1NlFMWFaa290hv29txP6Q5Atv6vM/kckxMYqtQMywv5igP/avxoJorXI8tmUfAW1O
         xsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746459790; x=1747064590;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jADEHGiMlecVFngKrds8KPNTRKyJX4Rr2PqMnmh5p04=;
        b=Cr5hq5mFxjXslODLw6JOseh19eM3IugGBeqWvJ9Gq8wcRYB4ShobmDiLA1jXqQNUDB
         JX/lkCL/tHYd2ygMUwe+Bzlbqk0MHlbETI+vdVNmxi43c6ha56tRf6/7bs4r6k7GQtRb
         JrfHq2py9ZXHJt4P9GKgOW7rH/j1Eh3r6wySSwZCxo3X1+7gb13S8SGr/MzsZGkn2MDo
         MYYRMJeFRCqAEeGAVcKk2VX4G1ogyI4l/lC11VFax3qqL/OnGw1x+vRHB8R7TOs5sih2
         aLYvtkVI9aGUKJnqu3yaMXDhh5di1yMZxGLR3CoXoxz+8Hj9Yuq5AVCZEorJTsoPiKCi
         +JWw==
X-Forwarded-Encrypted: i=1; AJvYcCXxJcjZg+3y5CRqE7gq+6eMsC/9wgUvbQsBUQn6hu+rKQuZITDLPIBGkE/mFSOJH+5/M71nqj8HyS1L@vger.kernel.org
X-Gm-Message-State: AOJu0YzIZUR3hswnx6dd4zcnjwpzjtED9QbZjO4cvCi0qm4XnOMUd8rR
	PBXWmu4oUuoho6PR1/o2ykr3zfZp+XcGVf8hoUA0PRoukWl25wspkVVWC8PMTvD/HrN6hh7p5er
	h
X-Gm-Gg: ASbGncuI841+aAkTO70KjUXeEbXK5HACKTRQQyLWt7JKcPxQhvencgcVX6etQFv3Qfo
	wgcdqlwebSy8Ig+MLkZDbtzMBSoRPPaHJmGsWfUzQAD1RUITIyTRBR5p2Uc0PEgOtfMo5fjLmDx
	Or2NNP284YNMsiQsbjPtkg/ybV3u05/gMdd7NTovne47gkXFuqOq9tLCI3qjuYCsz8VHwK+w8hr
	hcA573dqZ2thsAE4/43Fl5iEhLycSYv+EvcRKggmaRye/MC+EcxWRdaoDVtI9IccMXXLDLX4pxs
	vrTJ/KzP8onNIVFAefumcpUuQBMw5a+NA2nJnuYoRVx0rv3EoVpvW8sSi+lLp9cgDQl+Jb4+2aT
	1WryTDxzny9Nktp8=
X-Google-Smtp-Source: AGHT+IFL2btLIVQtJx76CsbwyLNK829LBAKSDjNc/uTEdqP95tY4Xs4YkW2YjtftOF3WDWyRbGLvmg==
X-Received: by 2002:a05:6820:1f11:b0:5fe:9edb:eafe with SMTP id 006d021491bc7-6080030c637mr4626794eaf.5.1746459790013;
        Mon, 05 May 2025 08:43:10 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:2151:6806:9b7:545d? ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7db20f9sm1668000eaf.16.2025.05.05.08.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 08:43:09 -0700 (PDT)
Message-ID: <a8f47109-f370-49db-abe8-955ba287ab0c@baylibre.com>
Date: Mon, 5 May 2025 10:43:08 -0500
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the iio tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250505074801.258da03a@canb.auug.org.au>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250505074801.258da03a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/4/25 4:48 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   1a521690c060 ("iio: adc: ad7606: explicit timestamp alignment")
> 
> is missing a Signed-off-by from its author.
> 

Thanks for reporting this. The oversight has been fixed.


