Return-Path: <linux-next+bounces-6424-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A6CA9FD14
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 00:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB3CA46309F
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 22:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FFD212FB6;
	Mon, 28 Apr 2025 22:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u49nEmfn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18B41DF269
	for <linux-next@vger.kernel.org>; Mon, 28 Apr 2025 22:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745879755; cv=none; b=sj5uGGOaEUKSTnT+icnyPNfLVV1W/pgThP9UuzvRAHLcrcw5FMwjZQmJS6+it0osR7PNce9ZhpNHqlDajaCWT0OYBQ6Xd4MdroLI+gJgoPjwrlPNiGdJBfwqGRuDxky5CniAfb1f3/5sbQkF32QECfUCKm9e5NXUEgrYbAtyJu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745879755; c=relaxed/simple;
	bh=FwyHQnqFrh89JvdkJDVJBT8VrtDoavVGWMSbA8mnvTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6184aBqMflyY+jhHYnKzFT9wIxDoBeEYMOk2R29u0qklcpzdlX9Cs3bn19tBGp6sYNzae23ujWH+8jbmM+Ch+bXweCiDFEa+4IyCredQVjhS/iewKFRX4tsL6v5DH3R/mos6JaaGRHPXHqLosyGIWzYuMuTb26Px3iC0ejp2a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u49nEmfn; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a064a3e143so2702785f8f.3
        for <linux-next@vger.kernel.org>; Mon, 28 Apr 2025 15:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745879752; x=1746484552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=teMx1EKcu+nxRoUAc/DsVYixOahJbe6wbg+W2p7Xk8A=;
        b=u49nEmfnyNB0HgfUsVBOjWtwpehf2fO4xLX7U1qLb/K5EuAFge1CxIBr/1X2Su+KnU
         xJB/zRrJdNhTYTvcAvQtHsTMabGjql0d2Y9MogOPrTsIx/VEitxZkvjCKrqkfYO1TkPW
         ccE/E2TL6eoTHMb3QR3BLgbGmbSBm+w6TTmi2yWV+gfgSjeuPChs8po06uVd3hd//cNK
         J3arBtUqkvNYwH5kOeXRziYk7CVuaZXvnn5+Ni39WTE2mZlNVqF6Xo9QnE5Eyqcp4urV
         nt+uanErBW7o2YMTJ2WtR7vHnptZi6rOiyWHevPQEBbsHGrAIZf+5fTs+BqjRKTpTYOw
         5Cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745879752; x=1746484552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=teMx1EKcu+nxRoUAc/DsVYixOahJbe6wbg+W2p7Xk8A=;
        b=rRS+FFmJBBcYtD2BmKcnMxrCW5nszskxM5sez7lwFy5T5WIQQ98IXi8HV0vKtX0gch
         7QaWca4oETGqczpfaz9cGWJ1rH/A0UYI/ElzJYU31o0UQgrEwFW5vooQEwgF/6SIz1PA
         WyPpnAF+VOce+Up5M/5r4Qr9vIxP8GM2MC0ij3wbMVD/PP/4X4cHirsHeknCgkjWrUsN
         +us7cMSVxfOxEDfNiw2qGuJdpKs9YLNs59JAQAR8kV+XMxi8S0TtjvsbQUaDQT3QIcf1
         dQtIO75tcN7UE33CbZiZUJgavip+KeE0HrpLahdmTkcnb250e+YXsmv6bPBfKPtCQPXC
         RqgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsRqXB2bU+RJfBW7SLluly6ehg19Te3ZAPGga7tC3OMO51mJ3y2x+lF1Ogl7/OmY4W4NouPufGin+a@vger.kernel.org
X-Gm-Message-State: AOJu0YwixCJts3mzXNFobPOmsrU5s85gMddILnKyFNIWt8YVOOguL2xQ
	5a/qXRXUd2J6Fpk+BT7Ve17IphjB6DJX6P4JAq8WBrmg53juLFk3icbbmj/JhdU=
X-Gm-Gg: ASbGncuf2xXnuVj2CusIfSUszjdvvwNEyGuhGbvJdySNxmtNbjk9FiZIHsocw4K3cbm
	npqXFaFdYncCkE8GdiPwxOwpCz0UgPJD613fgRY5ctSZDkdFbU6PlvpHX4KREGkBW+7FV0OHo5y
	kAxNiJlmDufeE6n4UE1mbpQMmfN0GtZnJlw6b24UbTwaCet9gVi7lp0e4wTDZe6+kq5K0WoBICS
	xEIvt42uOiYhW41GpOt47lnXDjl7zZ2XGyMArnxxX0esd1o2e9bkXaiX932aTWrhVoOh575Ueck
	Mt4wIXGJ/ID7ZwsUmQWnSiSriVQASLE0QATddkQbm2lz9XYOCw/LWZeECPIJWBh7RbyacskIuU8
	sS6RQjjj84kMyf44=
X-Google-Smtp-Source: AGHT+IFLzQYBKaJ+yZ4y9ZfnxYq/3Mki6Xg18rb0tO8Pz3I+4CpctlEV58FoB4J6FdFttDLeDgn8QQ==
X-Received: by 2002:adf:ffcb:0:b0:390:fb37:1bd with SMTP id ffacd0b85a97d-3a08949fec5mr1180949f8f.46.1745879752231;
        Mon, 28 Apr 2025 15:35:52 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073c8c973sm12284081f8f.5.2025.04.28.15.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 15:35:51 -0700 (PDT)
Message-ID: <db7fce1c-c051-41d9-9cf1-ef015b0f7fb4@linaro.org>
Date: Tue, 29 Apr 2025 00:35:49 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: error trying to fetch the clockevents tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250429082047.4af75695@canb.auug.org.au>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250429082047.4af75695@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/04/2025 00:20, Stephen Rothwell wrote:
> Hi all,
> 
> Fetching the clockevents tree produces this error:
> 
> fatal: unable to access 'https://git.linaro.org/people/daniel.lezcano/linux.git/': The requested URL returned error: 503

Seems like there is some issues with the servers recently.

Could you please disable the tree while I migrate it to kernel.org ?

Thanks in advance

   -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

