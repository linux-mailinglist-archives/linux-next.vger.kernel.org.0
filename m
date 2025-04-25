Return-Path: <linux-next+bounces-6383-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7A9A9C2A8
	for <lists+linux-next@lfdr.de>; Fri, 25 Apr 2025 11:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 285813B4BFD
	for <lists+linux-next@lfdr.de>; Fri, 25 Apr 2025 09:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E683824B34;
	Fri, 25 Apr 2025 08:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fCMxucKu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C99F22FF37
	for <linux-next@vger.kernel.org>; Fri, 25 Apr 2025 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571552; cv=none; b=gGja+bkebp3zCa4NPviVSM1ovlFqhZlzSihtwOPJSukro5Icdifom7Hg+fdJxunC9ogO0cC61k6UBSPhZmB0p1IHWgXBVuy39zDZpauycqlmaU7odOiSiW5eZrZsALbNo59izERHwPkozHCIpCpF0ScJIWxxAuMdF339sQLxQHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571552; c=relaxed/simple;
	bh=IOqzftBT1fhDk9Pfp86NcMZ7N7yHJML7+rwuNQl2mhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXB7xRDwt11OChVYzRuoF2CXIh6xLbOOy5HlnzhQU0xUqZV9uFmXE8m7nLt3n+dEKmCHVzMCPyHw5ij7LLR08aELGnMFycIF8eynUh0o4UieSaLOeOpID+AK9Psonekpewdc4NYx9YGnP5TikVnf/2XhQDPy0sUuqWKRVmheoOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fCMxucKu; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-60406de9cbfso750021eaf.3
        for <linux-next@vger.kernel.org>; Fri, 25 Apr 2025 01:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745571550; x=1746176350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOqzftBT1fhDk9Pfp86NcMZ7N7yHJML7+rwuNQl2mhU=;
        b=fCMxucKuTwhSH89t7bQ3zQZc9aLykaT1SZ9AmgoVJNe7alamgxlQZteoj3TUfFJyBo
         TT/iMmZGsNd4Z+KZTNzwkdPyGW4ALYsvgHAb78WnEsuxZVHLT44af71PcSkB7Gb2BE5H
         pAadpPO8U72FXjLB1OpechqkySMJuKxh6b9RuN3P9dylMp4IlfZbKxi6QDda8xfcrNuK
         I9b9O0XL/JV+siPaxK4uafB1I3F7Bt4Q8mN4glvQehvbWmmomYqUuTAXmtM4RBgNnjwd
         fFYaOR0Z2h88Znzdp64mFciEYqkoxUaTFA4GEYtgNQZ2YjpKrOgbX0IYuiONrfNNQpWG
         NvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571550; x=1746176350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOqzftBT1fhDk9Pfp86NcMZ7N7yHJML7+rwuNQl2mhU=;
        b=d0C+1NA4fikUFi//gROvWYnXjBereCygS1upEy0P5spEkvSOAkMsF57u40x6FTLJl2
         HIo6dOZ1EkYwxmse6UM1up5uvXoyJ0XfCDopb37p7sJ+4v2GwZSZTjJm0zkaTiD6ZoEa
         6Kg76fcnskXJ3+JP6I5MgaCgNt5ZqjBil2Kv8VsyyFJjDk/ZpMB/ffDSOX2nYXQrxKzT
         +z3E7x/X/mF0h1UOIZqNWgtojcdzns79Q8R7BS60SDB/0N670YvQoWZJM3X6eZanhnXB
         0GqUqz+FAvjvkc2wN2a+c0UVe/oINsFamF/7nyO300NoNeQLxemZnIs0dw8j+C1cn7Y6
         HvIw==
X-Forwarded-Encrypted: i=1; AJvYcCXFgKbYob6kGvtaTTvXL+pxP9pAh8pcfwfgVDCe0YaO5nrscSLlBYvOPRXqinFNh6S3lmVG8QIzjNPw@vger.kernel.org
X-Gm-Message-State: AOJu0YyEPIUABXVl0J9pW4fxpYejdOteaZUR/Us2uxOmG6Y+4vaeD1yt
	drDFv14+tojnAjnZcLWr30B8RlnsBdZSgp/0gIQ3QmwzY/j+BRc1oKYeTMSdrD3xc1aoAICYP4w
	uEig4U7MirkLU75xZNl+yLWpypg9nGdMe4lrbS13kBk+Y8sNkugHY6w==
X-Gm-Gg: ASbGnct3wUk/PqAXN0j1zGmdzgW7ldczJn8Dvedqm9GkvwrwP1SrqlwKjjt9nZ1r+Lr
	SXCyzvIbUV032CnWqD7kqQy5x6WsFSh9BcrSFlXcxn6s+Ra3/W7KpxJhcl8ACwHAW2F9H2Asvxw
	aKfztHuhlUbp87FLu72IexFDQ=
X-Google-Smtp-Source: AGHT+IE2hTmDaLIEWoWHjzAzKcQZSSk0iqd5qSc1OBIVqIyuuWw7yE2s/ohjAh4xTMRsDhhphEOH96pCM/ubE++EDUs=
X-Received: by 2002:a05:6870:fba7:b0:2b8:2f9c:d513 with SMTP id
 586e51a60fabf-2d99d8773d4mr950114fac.19.1745571550041; Fri, 25 Apr 2025
 01:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417090436.1c58cd18@canb.auug.org.au>
In-Reply-To: <20250417090436.1c58cd18@canb.auug.org.au>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 25 Apr 2025 10:58:58 +0200
X-Gm-Features: ATxdqUFB_IRMdNfH5punfBtnlp_3nHfUoeE_i4d3Trz5M8-dIsbmfZhtdJA9ZD8
Message-ID: <CAHUa44GxOGGO_CQp=HGGT-gbX76aDNbzfvU2ZWgg5fRbdzP2aQ@mail.gmail.com>
Subject: Re: linux-next: error fetching the tee tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Thu, Apr 17, 2025 at 1:04=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Fetching the tee tree
> (https://git.linaro.org/people/jens.wiklander/linux-tee.git/) fails
> like this:
>
> fatal: unable to access 'https://git.linaro.org/people/jens.wiklander/lin=
ux-tee.git/': The requested URL returned error: 503

Thanks for the nudge. I've meant to move my tree to kernel.org for
some time. My new tree is now at
git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git,
please pull the "next" branch into linux-next and retire my old tree
https://git.linaro.org/people/jens.wiklander/linux-tee.git.

Cheers,
Jens

