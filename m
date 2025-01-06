Return-Path: <linux-next+bounces-5059-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE011A0286D
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 15:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB8F61886994
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 14:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE791DF74E;
	Mon,  6 Jan 2025 14:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gsQ1cJsF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2581DF743
	for <linux-next@vger.kernel.org>; Mon,  6 Jan 2025 14:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736174777; cv=none; b=s1ahFyWiLcgMYB82EpCEG76jrb1j2oq4LzvbVuP2ogAJRXnOQx2qkwaQPRiTeE3/ro7uJ4D8nGYkj3TlONDX6h4kr5Bhn7P1bgSJRSobolj9rfwgIxnztr5QGS1UB5sZUAGnC2N+oQd1qOqXhJGJ0zAZ5IUBakr5UyNuhqXjZ68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736174777; c=relaxed/simple;
	bh=x3d1JJg/hVS+0hBT98LFsltpezk5P79AI4u9IHkRVUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kAShDsJeTMlcUMvTKD2GCnmodnpRp57egQSl0sWTrPuNs71ja9Xe3mi6rRGtY7V56KcVOXxncEM/e5Lp7eFzTWquxgJVZFFgJJ3yRVRz/sNwv7sXSrEa9+tpm0k7ZIQdH7RVRws1OhippPMa2u9DyyrWRpklsSPOF8UY9Kl9fQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gsQ1cJsF; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaee0b309adso1728311566b.3
        for <linux-next@vger.kernel.org>; Mon, 06 Jan 2025 06:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1736174767; x=1736779567; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a1pgOzQyih4UPY4EYy9GMG8OgF7eiSel+vNOAcwgiE4=;
        b=gsQ1cJsFxYWHOcvDMFfMp1NZuiGSuICYcPDzBvUJOYUO1p+h6Zj8g3gwsQN7TL1V6M
         ACOUxUaOdAVsstsy33mTjsXBGbc5/iHbNCWnWXPwG1RH9WXeqKPbldD7CVCKzPmlGC/5
         dS7P1NqVSjTDh9u6c23UlxgMNXRJRUHOFG964=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736174767; x=1736779567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1pgOzQyih4UPY4EYy9GMG8OgF7eiSel+vNOAcwgiE4=;
        b=qsWKCubGkWsqKNbFUjVX7VmS8t+MsnalZWuXJZ8f8y0RtdSMpvpeXm4i2fkydCVn+M
         SfT15C0qTJ+upeBsIBhKxthkfQfMVTUkp1O2JD7wzcbs3Z8cmDO6+GW97QmgLwE7b74N
         LNWB3jd6+YUlOQ3H4S8logTAHYSuGBG/1RFYay1PAskLhS1p9QwbOh5YW9G1wY4atCQV
         YgIKU035d9AoekC8ekdc/4zFmgI0a1iMeFgsytZ5CBQaMWqGGbvQfpQ0NJcuTf5gPJdb
         1qPVIE74lm5LkBwrmAFuJnGVxcau/16zT+6dBlJwdjLh0OCelzQ/NCx+eevkjBY3xwiu
         BkzA==
X-Forwarded-Encrypted: i=1; AJvYcCUVcb8rB8mEGNH+i7AzNsaQZgybaSInxbBoTyTOn/UaQtvHxFJKCyraTtQwRcuUBhDvy9Xwr9+fxNlF@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc75Um9I8sDS2RYlJBrHvpq8DfbTTZUmijYIB4y4qBIcEBLZVJ
	E2SFIvRxeSKIQBRmZHgub/oiuX29FIdMD1AjFyR/uoeRz+Ohu+ZHJvwohjiSgdJlXjdc13CEII7
	8faA=
X-Gm-Gg: ASbGncuxX7MLsUhjRBqB7y8qiW97+k1AsQywbIIMHgFoyi9jKMjmih0Gk5TxtmsHg7H
	ODbjHvixJ8UlowylUwOT22i4E+j2ozuzO590B96pqUwkH6KCWeze4boMvMiCBfwpBGujGUnrxlk
	vIdI/UrbElrjosBX7kVIClEO/ONIky4lzTOTF3MzZ9TuEKSG96gPKJR3LBzJDR93yKq5HuvoM0Q
	/zX4OLN5bpPSCkfpI1NAM0t+MM+s8t0clYEJbAAiDOzLgKcC12Hn7AIP3BslSjbT1dY+B6c7QyD
	6CuzcuKPVi7XUF4IlKczI5m1xi+CajM=
X-Google-Smtp-Source: AGHT+IFCRyoGLloT0chPqNL9EO3fgpmx5Ea4CnhynIH8YeeA4z7KH3AjzzBWIob0n/55VBuiZBoONQ==
X-Received: by 2002:a17:907:7288:b0:aa6:a9fe:46dd with SMTP id a640c23a62f3a-aac346507b2mr4190408366b.38.1736174767296;
        Mon, 06 Jan 2025 06:46:07 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e5029f8sm2248731766b.0.2025.01.06.06.46.06
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:46:06 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3ecae02beso18195333a12.0
        for <linux-next@vger.kernel.org>; Mon, 06 Jan 2025 06:46:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWm/SFenm+6W1ujM0uAQlx/MeoP/gZ4X5JlpFZ/SeoqUuWlGZW7Vlm81u2m7F3CoAmXiS7ltMj3wwDg@vger.kernel.org
X-Received: by 2002:a17:907:7287:b0:aa6:a33c:70a7 with SMTP id
 a640c23a62f3a-aac347cb97emr5592623466b.49.1736174766358; Mon, 06 Jan 2025
 06:46:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250106175107.48eed897@canb.auug.org.au>
In-Reply-To: <20250106175107.48eed897@canb.auug.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 6 Jan 2025 06:45:50 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgjyEtLJfnY0zCK6sp--M3T9ubECNS+OkUWJ7NDmvPo-A@mail.gmail.com>
Message-ID: <CAHk-=wgjyEtLJfnY0zCK6sp--M3T9ubECNS+OkUWJ7NDmvPo-A@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the linus tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 5 Jan 2025 at 22:51, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the linus tree, today's linux-next build (htmldocs)
> produced these warnings:

Thanks, hopefully fixed now.

             Linus

