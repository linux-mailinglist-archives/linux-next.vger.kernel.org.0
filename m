Return-Path: <linux-next+bounces-5526-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F65A3EC4C
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 06:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C3DC19C5304
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 05:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB70E1FAC38;
	Fri, 21 Feb 2025 05:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Grm+KJKX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2137418D65E
	for <linux-next@vger.kernel.org>; Fri, 21 Feb 2025 05:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740116786; cv=none; b=GY2owc6Z0cUt9HJS8qxG9nsyTsDyrZWlsVaedPQQJfwk7ttgRGuU1N+BiVEih/4FEHz7aLrogKiTnO2rkbQI74u58GdY64qvxu2m4NLAI9mknfY+6ruk5+IHMfU+dDp4yI5+3V5gWaa3WBVzKnS5xg8W1Jo7XGvL+3B0ONd8i4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740116786; c=relaxed/simple;
	bh=eTE5Qb00NNZE3F+GfObQZ4TzzZjogZ+hCA40EodSgn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SaYOFpPCfjRxqBfKHn1J8xnv5Lhg6cAn4tOQZ3dgOq25G7QqxCTRW5N3r/c9qnSvBkqqXgDSGx/zW0ViFT+fA90g+A9dkGcFdCIp0OAvisb/9d9ZdZnPf1qN4zgBEw1lDgngyY0Z43GJsD5WW077m50ZoGSUnBBA+cWlRToYLO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Grm+KJKX; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f2339dcfdso30347975ad.1
        for <linux-next@vger.kernel.org>; Thu, 20 Feb 2025 21:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740116784; x=1740721584; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ouei2VTwRQWmGRLyAl+cvX6cCvzvQcBTYQL0O5+vXXw=;
        b=Grm+KJKXmYTw5Gc3Wnb3ClhiIsF5J1NJ1UPg2jGlqXnqOXIFWGCZRc/LJq3L2LTDD+
         +tU8gANpM/Kp18DpEI9Ld/9QzxC3nWbz+d65lp/x7YGidlLWCnPvBXIHtrQHgCV4ibeh
         jrriTCZpWH0+/VgcCljCr4z6h6WTApslkVBDZYFMB0VnV8tUHdAx1tp2UM5zT05KC+wg
         WuKD8Xkdgt1x/7KDWYcCdA4dBVpsE635baF510SqxQVbEElN8LZivaSBeMv0ZntPedrT
         3FW7bUE4AUHgyVr+xUgsTs6Jzp4MzyvWvrHpSdmZZT469aWlxaq9L8b4y7c6k07Yfl7E
         pxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740116784; x=1740721584;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ouei2VTwRQWmGRLyAl+cvX6cCvzvQcBTYQL0O5+vXXw=;
        b=nrNQPFaMNhRoAi15DTgzENrFobhvWe7hCnANym2WSrb0MyYwlY4yqReZhwKGx31qBP
         HCLiIFBTQ6trLA/kHcvsjMcsOI+HM6A9bjAiFOeDW1POyahlCB5V9FQJ1bc0DrI1CnlZ
         rf3UuaxNVmAV/Rm02ok+ng8bYlkzNqBmdKrGnqhkw1XXf3B90LxUNITieDn2Tz5VKMaG
         FxupRN2A11Ug9CKe0fzBV5EzII+c777m2Ztk1g3lYWWDCYe4vGgkyQ6b5V4tObJUk/yF
         Q5y8cf5GqYus8dE/Xcp7AL6PaSoux76oV75nheyfv0pFHHZJ+KGjBXb2UAWnGD9d280g
         YbFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPewMIyDFVKuMJhs6uMXPwQ0XcDKfQgHeGk+TIyTOXni6kk4lDTnb0PbZs6xpmhhYwqJxWtzb5czUt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc2JJIAfIQY0yzTHZbprTQSM020jM2ztvfeozKeYT9h0+fZBju
	KoO9NFZ2uNcF2nb0cs37lQjM5QMcGWLFk0+huFVZSeHjHZJ0hFv5C4e+GZDp8A==
X-Gm-Gg: ASbGnctwJeepnAHOBsK46HAJjqFRbRBjSWKn3UfLf6OhMP609O760XwwBuihJfFdSIi
	dSazHKPQwPXWM8lTIxS0k1qX2Kbj4ZbfoLuc+4re0noOm49iGBs7CdskTMY4NKv31KbiKatSBO1
	lpFkPcd54PcnsK+8Bcf6nBiY5dSeqHb9cY12Dt/TnBvlqWHlKniCqpLODiQLmB1XAiewbK1lfUG
	gy89OR2U4jvFO9em5RRPIMN7QrN9uLLYtFOdHSrhP0rO3wnJlXv7iwfo/uWKpCLmGVA7MorjZWW
	J/zqOJcP3Axdh9TS/dAzxLPJ+JiBPAb4JWU=
X-Google-Smtp-Source: AGHT+IEA54pL1ip8cSRNGmHkvOyN53AOFfgXrzau/VI9IcNo/aqckoQg9m/vNMh4kPIt3AOE0f4CIQ==
X-Received: by 2002:a17:903:41d2:b0:21f:ba77:c49a with SMTP id d9443c01a7336-2218c3cfaebmr93354775ad.4.1740116784400;
        Thu, 20 Feb 2025 21:46:24 -0800 (PST)
Received: from thinkpad ([120.60.73.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-221040434d9sm97367635ad.196.2025.02.20.21.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 21:46:23 -0800 (PST)
Date: Fri, 21 Feb 2025 11:16:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the mhi tree
Message-ID: <20250221054620.orulewump6jgzstz@thinkpad>
References: <20250221161344.09a6cf09@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250221161344.09a6cf09@canb.auug.org.au>

On Fri, Feb 21, 2025 at 04:13:44PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the char-misc.current tree as a different
> commit (but the same patch):
> 
>   0f96e4d32983 ("bus: mhi: host: pci_generic: Use pci_try_reset_function() to avoid deadlock")
> 
> This is commit
> 
>   a321d163de3d ("bus: mhi: host: pci_generic: Use pci_try_reset_function() to avoid deadlock")
> 
> in the char-misc.current tree.
> 

Dropped the commit from mhi-next now!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

