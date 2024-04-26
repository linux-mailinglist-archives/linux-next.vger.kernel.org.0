Return-Path: <linux-next+bounces-2058-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2718B2E55
	for <lists+linux-next@lfdr.de>; Fri, 26 Apr 2024 03:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0967D1F2105F
	for <lists+linux-next@lfdr.de>; Fri, 26 Apr 2024 01:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585C24685;
	Fri, 26 Apr 2024 01:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YUheuyL/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B34EBB
	for <linux-next@vger.kernel.org>; Fri, 26 Apr 2024 01:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714094801; cv=none; b=jgBE6xSxg4fwvmXZIEHwmdiKXXNhEUOP8MZckpNtvBh55rx4V1ONy8WnroCiJfu2jPS+CktG1w2vGrfyWMXF+WXP47CkVQZLK+a6ECLRHswhl9Wy0QfFMXxQW7RZNAURLP+6qEQNycr/SqiOViktEiLAfRkPlCJDU/h2oobOU1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714094801; c=relaxed/simple;
	bh=1q0TtaQtyMdaDuRgZ4Nyk3S/pmz6Klbw2ZPW+55Ew8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OjLZUnGz6VkslJarY2DIIVAU0iWCBDY2RNiMeUumRqLY/SGL7UwErVwHSjfEy5lL3A3iIX8trQpgIZj95O+KUYOEAlDDbSx0lP0SN765yJsi4BKAGr2f6CpzT7N9SJBEKRCV/iYgZVeK3FE+4dzntm6P6VbJogsdvzXTwyKQDfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YUheuyL/; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6181d032bf9so16276467b3.3
        for <linux-next@vger.kernel.org>; Thu, 25 Apr 2024 18:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714094798; x=1714699598; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N9TWcvH5EBDAropkGpa6+CbLQtgma11A46fGKwwuf4k=;
        b=YUheuyL/5X1gsBAvSaOoT8H6EQWublfBMXNCLJt3EO0OX7JY2kGZGYJse0xd1ToLpA
         wbaa56WKZ4X8E26I1I8nQ58XryXVrKlgjicPcWDUfSba0+Yo9fgg6T7EY+jPFgbyrvBv
         ldDVESyrL/FNFq8vWvBh6gcYZaxL9gq4U25v1SyN7uHlfRKKPi5XGozHLMAkIZx0i6sS
         am6xR3t14iJV5nQ/73pzWCCBR/5MmfHR3o/VpmnzIb18kPDJgJoxiF/Qo1fpvNBQpP6r
         hrCJ90//ESQ+FKB1ZYEy3zIo62Zt1i1KS+FgzgSB0NTEwPkZpXmDGL6JpfunrKNjkn+H
         CcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714094798; x=1714699598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9TWcvH5EBDAropkGpa6+CbLQtgma11A46fGKwwuf4k=;
        b=XVSTGwOAtSXNK0XVHmn0D0Rr71fIRGnn/syFnxMu0t2j/29P4wnc/m5e7Dvy4DzHs0
         vZv1G49m4ro5tlkY3zkEjYfme7DuVFMkxVucadT7G4WLq2wJJm5MGaeRpe1KHLy6N3K/
         OadCzbOlT8892d6F1fyuXk8pTSr5/gCg6cJ9akLBx6Jbvp2LW2x65nfHg/aOhXk5r6Sr
         zOwHBQ1SzWhNPBu5CRzUnEsuuVbWdO4B4U/30VPJizy51VzvRUFQr31kM3h4foQPhV4e
         xh6XHxSOZBXbEJ0LLsDkg7j6s1VtaVSs2pYsPfREWiTfZgaAE+f8FmxyY9U12y5y11N+
         6OCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBqqfqvu6MlHV9nqHrY2rXYBZNCMxF9RHcnBBcGVpGTP7UWb4upF7e9vXLwTYZMZRcK+oc2fWWxH8iaUe0PvD4XTX+pkS3NsPHCQ==
X-Gm-Message-State: AOJu0Yy6EI3BcOuvVxgAGZtiyNeoTfIaHyUEhfULDCaPLVthWGozf0IR
	NqMlm5WK4MSYEty3oN0l4cYYCE5qkgJmXaWEk3vCz28iApWDgcdibAXX35sgyeAq+NMZLFUP7Vy
	QHClfafcTLSOV7XIcXJWxj+SNeb3Wk8ZYyGfkPkQYKEN9LYCQ
X-Google-Smtp-Source: AGHT+IHJzHEvKWC4gA7GYM8pPCmbmIkkDpzJGkE+0E4qvqcAPNQ3QfLmUlX5Bc4aSvMtqInOlIdJ5HDmReZ7s5C8YeQ=
X-Received: by 2002:a05:690c:7201:b0:615:f53:64de with SMTP id
 jl1-20020a05690c720100b006150f5364demr1245954ywb.29.1714094798725; Thu, 25
 Apr 2024 18:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240426104618.43d926d3@canb.auug.org.au>
In-Reply-To: <20240426104618.43d926d3@canb.auug.org.au>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 04:26:26 +0300
Message-ID: <CAA8EJprYTKSwS+r+u3yVbo7cLVkA+XnBT9UHVt+yM4Qp3u-GnQ@mail.gmail.com>
Subject: Re: linux-next: error fetching the drm-msm-lumag tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 26 Apr 2024 at 03:46, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Fetching the drm-msm-lumag tree produced this error:
>
> fatal: couldn't find remote ref refs/heads/msm-next-lumag

Should be fixed now



-- 
With best wishes
Dmitry

