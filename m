Return-Path: <linux-next+bounces-6667-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC93AB25FF
	for <lists+linux-next@lfdr.de>; Sun, 11 May 2025 03:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE9D919E1A69
	for <lists+linux-next@lfdr.de>; Sun, 11 May 2025 01:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6985674E;
	Sun, 11 May 2025 01:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W+GiUOj5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066734F5E0
	for <linux-next@vger.kernel.org>; Sun, 11 May 2025 01:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746925774; cv=none; b=fiXUcsdVjSqVNJkHqcy4XzE2kLbL5yKlai68ZEgiedZRCe5wUT1/l+yS0zR+k9m64XCNsJ/CKELVZZVTwv34+ZE5zeaDFk4OBwENkJ+869Hnz651mdEUmcdCMPH4IiZKU9mwmmVWh3iL6K4wUG7VCKx1aah8D3JEoh2LGuNxd1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746925774; c=relaxed/simple;
	bh=4MedhLIAtxfBJ7juzuHcFhIJgej77smd5W6HDM2mc2A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To; b=uxeg2k7/okMH9BBEipMujiZaYtpdqZQmUUb9Ds0I6cb5OXF2xIVb1OQVkwAGZ3ptbAYde3Qbn5lSA4nIm/3F6bbqwZW1mAKPvtVlDn3AqfSUKnNgNB6pldBoSKI6xk+jlBcx5wjcgqi7dl7IByk3Ftwqig5CobrdatNGVdXNFiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W+GiUOj5; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a0b7fbdde7so3007989f8f.2
        for <linux-next@vger.kernel.org>; Sat, 10 May 2025 18:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746925771; x=1747530571; darn=vger.kernel.org;
        h=to:from:subject:cc:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aqCWxzc/LF4mwbSHgXAH1Y8wfV3w1TZlyAnsWm2HFII=;
        b=W+GiUOj5WfkRfGvWhtiN5eyPwE9TKhTFh65CZGrhDQQX8mzCJOjl1XhkQJztvCi2VK
         bzMDpCc9E9C4M4uewBbPBWBOg+xUi6ELlw0sprMjInIlnBXRX4tLzTZ0/n0TWKpdnRv+
         mg2H0lqMPXIGFPMpYR6Ww009bbnV6sBNV4uHvSciP1qrVToRNg2tYtlmwiczwXBMO+6J
         Iv7egWnGWBZu8kNtlEqoI0g8fHgmrF3t0B+TjWLa1xPorEfmmhojJsP8o5wMMp2Wz++d
         GDRzwISMLOOhSqmJhQPQTamUM3oUZg17ROAd0cOGP4oIaFfiQZmwNVvnY4H81LG+63sU
         JS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746925771; x=1747530571;
        h=to:from:subject:cc:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqCWxzc/LF4mwbSHgXAH1Y8wfV3w1TZlyAnsWm2HFII=;
        b=hvVyHAAJHbimq/VK6G8HYLe6ebtL7P9AQxhMkEvmlMs88SfPC4HJNSTcj5dtRlR3RK
         0Q1Hrm6MyoICEXr6Kmq2i9bCB+buRbdyBLqPJyAlyitbo2GVObH3+NAcHzM+AdqpyvCS
         c9Qe12TSDptF818frC4vdBQ8EJami4MtzVWyiUAjv1OgDpnISZO13qi7u1dUibIHjMsm
         aCfYzknKjXomjRasdqV8jXVy6uUPO2Mzwkpi+2zLciEYQvf/kTE/Y7xm2Fd4KOHKrVT8
         kRZFeaciA16BipQEpzclZVty0A1JyV8jEcGpGG+DrtoE09Tcd9vMVDKTm1LRxSV0Ez8Y
         /oQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY5QFFxTkDieGbKmlPj7DhMujcMGZ9NCCTLcyDOYLnAunmt0VaQ+1SjlkeHhXjuShChFQG23XTWM7J@vger.kernel.org
X-Gm-Message-State: AOJu0YxyecVmaqstVgyr9/tJ8kwwHM4MuNaX0X3n5qS5qCYDEI6Gp4BQ
	3rjRkfhIcHCFxtXqpCLXac5CYWzBmi4XRwCzB8XKmHMoHFjDYYIuXUyOT9JWUbo=
X-Gm-Gg: ASbGncse8hP5YKvKLmobGr9WVaBiDQ8dvLm4g5yDYZy3qdFl43ILL1Ea+20EB2+RTDf
	eRukIJ43a4n4/cPsI6u50NAiq+dIS2mBAAw7YMqO5UxrsTRrWrMPFmvH5RV2y2KOJ4Mimmnv0aT
	5HXhyhXNibGrsoLEAfrOLsLqio23S3S4JWLxSd/6GEtiiQ0mf4zpTy7EYwEsgaDEstmqD4HrOt6
	pUlGfag2IQW1+LMNuCnQ3Gd14Ok/VxBuNNaoQDiagfRpKt5CkbIV9Q4o0gF6YG629VlyWCchSfM
	UynmBizVXV6Kd/A0xpa5TNC6zqIO6jtSksGJHPdugFiibsVZ73A=
X-Google-Smtp-Source: AGHT+IFoTmZ/NIccZ5HMBwKYuooZHRaAIWQAsw3sw2JRyk4vYHIQVqEDgdSTxag0Au3HQzPQ4XRVLA==
X-Received: by 2002:a05:6000:2ce:b0:39a:c8a8:4fdc with SMTP id ffacd0b85a97d-3a1f6437880mr6788989f8f.16.1746925771223;
        Sat, 10 May 2025 18:09:31 -0700 (PDT)
Received: from localhost ([2.216.7.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecaeasm7739674f8f.28.2025.05.10.18.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 May 2025 18:09:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 May 2025 02:09:29 +0100
Message-Id: <D9SXI3F82EFT.7WY8FQ9P4RHL@linaro.org>
Cc: <peterz@infradead.org>, <neil.armstrong@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 <andersson@kernel.org>, <mathieu.poirier@linaro.org>
Subject: [linux-next regression] remoteproc seems to be broken
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: <tglx@linutronix.de>, <linux-next@vger.kernel.org>
X-Mailer: aerc 0.20.0

Hi,

we started to observe regression on linux-next starting with next-20250508.
Neil bisected it and it pointed to:
2ef2e13094c7510c40833951c2ec36cf8574331a
genirq/chip: Rework handle_nested_irq()
https://lore.kernel.org/all/20250429065420.744042890@linutronix.de

>No functional change.

Manually reverting that commit resolved the problem for me.

I suspect it may affect more than one Qcom board but I test it currently on=
 qrb4210 rb2.
Mostly failed remoteproc start up hence no adsp, cdsp, no wifi, etc.

[    8.937745] remoteproc remoteproc0: modem is available
[    8.963841] remoteproc remoteproc1: adsp is available
[    8.971927] remoteproc remoteproc2: cdsp is available
[    9.027266] remoteproc remoteproc2: powering up cdsp
[    9.037796] remoteproc remoteproc2: Booting fw image qcom/qrb4210/cdsp.m=
bn, size 3008020
[    9.153625] remoteproc remoteproc1: powering up adsp
[    9.158697] remoteproc remoteproc1: Booting fw image qcom/qrb4210/adsp.m=
bn, size 13196348
[   10.357702] remoteproc remoteproc0: powering up modem
[   10.442049] remoteproc remoteproc0: Booting fw image qcom/qrb4210/modem.=
mbn, size 8881672
	...
[   14.508388] qcom_q6v5_pas b300000.remoteproc: start timed out
[   14.508418] qcom_q6v5_pas a400000.remoteproc: start timed out
[   14.522733] remoteproc remoteproc2: can't start rproc cdsp: -110
[   14.532531] remoteproc remoteproc1: can't start rproc adsp: -110
[   16.043271] qcom_q6v5_pas 6080000.remoteproc: start timed out
[   16.058593] remoteproc remoteproc0: can't start rproc modem: -110
[   16.076600] remoteproc remoteproc0: Boot failed: -110
[   20.143356] platform sound: deferred probe pending: platform: wait for s=
upplier /soc@0/pinctrl@a7c0000/lpi-i2s2-active-state
[   20.154630] platform a7c0000.pinctrl: deferred probe pending: qcom-sm425=
0-lpass-lpi-pinctrl: Failed to get clk 'audio'
[   20.165381] platform a600000.codec: deferred probe pending: platform: su=
pplier a730000.codec not ready
[   20.174738] platform a620000.codec: deferred probe pending: platform: su=
pplier a730000.codec not ready
[   20.184089] platform a610000.soundwire: deferred probe pending: platform=
: wait for supplier /soc@0/pinctrl@a7c0000/lpass-rx-swr-active-state
[   20.196738] i2c 1-000f: deferred probe pending: i2c: supplier a7c0000.pi=
nctrl not ready
[   20.204793] platform a730000.codec: deferred probe pending: platform: wa=
it for supplier /soc@0/pinctrl@a7c0000/lpass-dmic01-active-state
[   20.217114] platform a740000.soundwire: deferred probe pending: platform=
: wait for supplier /soc@0/pinctrl@a7c0000/lpass-tx-swr-active-state

Thanks,
Alexey

