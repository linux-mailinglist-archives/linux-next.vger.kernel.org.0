Return-Path: <linux-next+bounces-328-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9BB80C7AF
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 12:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52D991F2112E
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 11:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE132D622;
	Mon, 11 Dec 2023 11:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a3hEqw1Y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA437F3
	for <linux-next@vger.kernel.org>; Mon, 11 Dec 2023 03:09:30 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-548ce39b101so6137078a12.2
        for <linux-next@vger.kernel.org>; Mon, 11 Dec 2023 03:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702292969; x=1702897769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LyfE8VPP+jKkzsqzZmDn4AjOdgAMsVW+As3oZ2Yyxl4=;
        b=a3hEqw1Yg/nEpgJ8h8k+rvyI4ZLjVBLlgtZogyPvGDcCGM4fq8yn7eN8Q+d4zDbaDE
         ZyIUgt5btbd1xsQoVO2vyMiKOEx7L9aXMViusIsWRp3i/nfWcKZJlkVN3mWR5NvkX0VP
         XY3DASgfHGDzK0W7KUDjY+NTNY7BawwVkIkEHu4Iq2IujugQSgLay2oZepzqJyA3yNEk
         Mt4uOHDx1H29QR5NG3Qq5RBRxqsajnyV9mLnQeXWGOA1Fnd4asxqRsmNqkBW1b5sQxve
         TTfW4wLfrNRrtMTJtmTCJMUMLfNCCeB5rbM14QJUORv02I6HiFOu+HfbSA7AmGqj9iYD
         nwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702292969; x=1702897769;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyfE8VPP+jKkzsqzZmDn4AjOdgAMsVW+As3oZ2Yyxl4=;
        b=HCY0S/yhjbv8i0cAE0XrhlHO08qBUyrIAn4sc3aEmHH137J4i3ApKCrHckOEX8vdxz
         CUl3g8nsZbPmpCNcm8du4SRY/SfUAkVUKRxW6Rn+pfPwmyJITHaF7rLSuCGx83/Shlo/
         Rt6engqAQcTiFYpSSbyGm4/ZrXRV1Al7uIvRERF3/2w9HEqgtFyEwion09reMuJi/u+P
         9I3jzrC7c8VwxCaQzP81WdiI32yKxuzsudqkHTT9MwEwKQxC6oO6fg4yRpouF7SghACK
         K+GApKUcPry+3p8FAMjM8wpgrTvkqDnwC8P54OE7ol1fvLiY5t04I5sqftYLTRWtmV3W
         Hifg==
X-Gm-Message-State: AOJu0Yzqge+v0JydWd/vPV1zzxIluZh/y8553383tJ03pQo3Blj2CpS3
	7hUDFpM54gmOUtJ2zy/1ljDC2JEfxLkZT+0wPMY=
X-Google-Smtp-Source: AGHT+IG7flMXnvGlsXDEnxloKTWGQBrZghilaVMWEWQvYtmZTUzuVKEKyJWzBNz+Ke99Xe/GWbImyg==
X-Received: by 2002:a17:906:fccf:b0:a19:9b79:8b47 with SMTP id qx15-20020a170906fccf00b00a199b798b47mr1164955ejb.88.1702292969116;
        Mon, 11 Dec 2023 03:09:29 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id tr6-20020a170907c58600b00a1f73d6f079sm4028469ejc.84.2023.12.11.03.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 03:09:28 -0800 (PST)
Message-ID: <dfc3d1f8-79fe-494d-a946-0e317d36d51c@linaro.org>
Date: Mon, 11 Dec 2023 11:09:27 +0000
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the nvmem tree
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231211084841.11b2ee48@canb.auug.org.au>
 <20231211113419.327947a7@xps-13>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231211113419.327947a7@xps-13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/12/2023 10:34, Miquel Raynal wrote:
> Hi Stephen,
> 
> sfr@canb.auug.org.au wrote on Mon, 11 Dec 2023 08:48:41 +1100:
> 
>> Hi all,
>>
>> The following commit is also in Linus Torvalds' tree as a different commit
>> (but the same patch):
>>
>>    05349b48e254 ("nvmem: Do not expect fixed layouts to grab a layout driver")
>>
>> This is commit
>>
>>    b7c1e53751cb ("nvmem: Do not expect fixed layouts to grab a layout driver")
>>
>> in Linus' tree.
>>
>> Also, please keep all the commit message tags together at the end of
>> the commit message.
>>
> 
> This is actually fine, Srinivas needs this fix in his tree for
> applying other patches, but he anyway sends a big "series" to GKH at
> -rc6 who finally applies the content of the nvmem-next branch.
Or I can merge or rebase on rc5  which should ensure that there are no 
duplicates.

--srini
> 
> Thanks for the reports,
> Miquèl

