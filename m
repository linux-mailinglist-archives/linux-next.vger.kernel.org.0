Return-Path: <linux-next+bounces-7517-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F7EB039A5
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 10:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DEB97AA49E
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 08:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9F023BCF7;
	Mon, 14 Jul 2025 08:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Um7C8wHO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1154272600
	for <linux-next@vger.kernel.org>; Mon, 14 Jul 2025 08:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752482263; cv=none; b=fAfQPMQSkVCEO3fBgga0DngGtv4q8g+vMnU1VQwtLjuaZfFixaYdNx74i013SXSkiruduZBJreK5Pk3KteiyN998dVYsZSE8bcleHUQtgOPse/CSDGO7gFvOlwzBAw6LAwvI3eW/48orOfvw3cdgg2y46HOOwLhGDyLiiyWfcus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752482263; c=relaxed/simple;
	bh=cFj5eeBSExWTpQ/HwTcn0/zymDyCea+9T3MnfE4Y/As=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=s7hMtzNAl8idYrKOocBVJunvi4O3HDQLH8da9Be8jW2J4na7eepPCt62TCoUSnSwtrgPHUsb3fX2OmfZ4WQyh1XGYxCN8UGOer6xMr+PGJ1hRW3UCGuv5DTA6mQ+zavj7Qx03OMfoK+ylk/brLfSHl96+M29hLqPopy030TxQV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Um7C8wHO; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so8961421a12.0
        for <linux-next@vger.kernel.org>; Mon, 14 Jul 2025 01:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752482258; x=1753087058; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXsZdLs2z4I7jkOtdXK4ZMSs6eg0//WRTlMsswQxRuw=;
        b=Um7C8wHOb2QsR9ZTi7oYXdzojDvLtC0pbkZkZanPRXvOB7v1DH6AhRqhOCB1THCXzt
         bg5moJVh/v1NF8eG4saGQ08/3lMFVr/gnKaa/qBQlaJKLMsK8eaR0sM+3+zsen7l/X3F
         plFvcr7afbqnqnq5EhD4j+oADdFWqtc/VVGM65OmJQrxkB1gWh4aVjFTu21H/eHXCaka
         nRsCMk5oC8DKocGFnb8ixIUNTMjkDS8wzdliXYhlSuxDpEG5hNdSJ+j+psi8Sgn/x0Pk
         ZvxQ+h+u49g5asxfxW4Ickag4SQXsDp3PLHHrY88IMK9JD/kH2ySvvEjyzDlKEoKHQDa
         S1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752482258; x=1753087058;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TXsZdLs2z4I7jkOtdXK4ZMSs6eg0//WRTlMsswQxRuw=;
        b=HY7MwHEz2iecGuqfHHvtuoY5kPx/Jmuu7osvZxECCXMr78ApCxsbuiPaSlKKjgQmkQ
         hZ8jo0UL4iZxRG73bSWPHvyPNiizhYuL1/YuexAUNsAEXukfr3UXRw3YNPhjiEQyRkzm
         y8+l7RHIMcKvS7X5bKwYDSunPJL2Tl6DoTfOBO2NuEaYlW8wA5n2lYGRqBCwVG76HmBT
         /gKqx46KeSJSUseCj9ApZB86/lzxTTo8mCgY0ATTs4tVbL1v7XfRAKN0Vdbnz3FIakkB
         EKMm/CYZ2VF3czPTzqciSl0Kp7KkvNx0iqR8KT7aHib/UIkPf6N6wSFKiZOo5s2bPIo1
         Xp9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWM+oN2fyfJV6UkUEqUk4NpjX41D5m/VylapjlU1BHvqy5qq45rB2WfWTBFKuzx1u9q7GqyCH3mfKe6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/pX1v+Pm2XMmHJUwEudk69OukSYiH3aSqojKp6cJvfQ/HGbOD
	oH8lqvWDX2majMm3ZhTgL63ir0PdtSiNEQasqk3NtVgtas7icf5Ygb4XFjd8qz35Bm8zh/5sIbc
	YkEuF
X-Gm-Gg: ASbGncu2V7bZ6wePZMfV2peCybD2eBvBeXgiC2EHkAAYpMleY2OJifSvg7gcwCJJn7e
	82KQNxDF83sD0Z+Lb+B3Udf5hg06no2Xkw/gyqavUR+OHXueUPEUBV/tSSe6qVlp7RMvkZoKyiC
	jCmVp1aPqLlfMJu75xIrtKogISu9sWjInSv3hmMI0YdEaap4xp9rUs+/i7OpvXb/3MGmiVaBp20
	Fl/9Pf5DOFLdhDlglcd93+VQcPQpFtTMpv5rGWz3Hm6TF5AhKvxXSrCVMX0BXlAN+8anpTPEqCB
	FIvgANECIFnq8D1UL3shs2Ye84v00eOJijHZJKp1bqDNTSBvdBpD+7ZJTX2/4Pc3Mxg1Q5vQlW/
	ptqkcIiRf3WcCb5RN33Z44nOWD2O4ZmglAbUzxVZsYZDGmvFNu3R7Cs7CJN2v6fY1RKw92AGOy4
	C8qhTHMlYwgHqL18anBCcEssKIjpToozt/gg==
X-Google-Smtp-Source: AGHT+IE2Qj0I2yzWrMiGCxaPbtun1R7PKz3AbxgLlIXZKbAlmPcU2AVCewde9Sqhm+0Au9TYSEdYHg==
X-Received: by 2002:a17:906:f596:b0:ae3:c777:6e5e with SMTP id a640c23a62f3a-ae6fb838efdmr1224680866b.19.1752482258190;
        Mon, 14 Jul 2025 01:37:38 -0700 (PDT)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82645b8sm782699366b.106.2025.07.14.01.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 01:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Jul 2025 10:37:36 +0200
Message-Id: <DBBN42KD0D2L.10BGEGJJ5XH0J@fairphone.com>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>, "Linus Walleij"
 <linus.walleij@linaro.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250714170848.0fb46353@canb.auug.org.au>
In-Reply-To: <20250714170848.0fb46353@canb.auug.org.au>

On Mon Jul 14, 2025 at 9:08 AM CEST, Stephen Rothwell wrote:
> Hi all,
>
> After merging the pinctrl tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/pinctrl/qcom/pinctrl-milos.c:1323:19: error: 'msm_pinctrl_remove'=
 undeclared here (not in a function); did you mean 'msm_pinctrl_probe'?
>  1323 |         .remove =3D msm_pinctrl_remove,
>       |                   ^~~~~~~~~~~~~~~~~~
>       |                   msm_pinctrl_probe
>
> Caused by commit
>
>   b614f176b308 ("pinctrl: qcom: Add Milos pinctrl driver")
>
> I have used the pinctrl tree from next-20250711 for today.

This seems to be the for-next/devel branch not containing a commit from
fixes. I'll let Linus sort this out, just needs one line to be removed
from pinctrl-milos.c as per
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/co=
mmit/?h=3D56ec63a6e107e724619e61c7e605b49d365dfa07

Regards
Luca

