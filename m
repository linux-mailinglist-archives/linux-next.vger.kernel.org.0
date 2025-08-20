Return-Path: <linux-next+bounces-8031-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A231B2D33D
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 06:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D3992A8C87
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 04:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F188246782;
	Wed, 20 Aug 2025 04:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="DDJ6jwT5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACC7224B0E
	for <linux-next@vger.kernel.org>; Wed, 20 Aug 2025 04:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755665947; cv=none; b=fTR3Pp9lEwM1pYQJRTmxkqLyEAnt5b7pqmm/Wn/jA3JK0qX82qySesWBDychtIXzhCmDOyG8kft9ZDBlK8mkQ/uNLnSouxcVPM3XwFuwRTZDfltU3KyE+d7W/m0e8fur0Ccgi/AkO+ZHV8mRdrwvzQhZQW37WGmJ1l6TVqbuHdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755665947; c=relaxed/simple;
	bh=WUYaRARHPoTsc+YvcIogF4jFSzCJSoFP7BpyqoKoIDs=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=u+0RStGG6abvv7hYW9nz/mqifbDJ7RjKtHj65Pg2YIDR2zwrQOzWr6G6whtdqAaOLGADbRjtYAZR+cRP7GyWU4BSA2UO6qfSxgP4h6raL2bQmFotpkjP7q5bCHADgJoE1o30J8bHD2ZTxGmBFyCNJeWndPdI9OL+YzFpnVMP7ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=DDJ6jwT5; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b4743621044so1906775a12.0
        for <linux-next@vger.kernel.org>; Tue, 19 Aug 2025 21:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755665945; x=1756270745; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tfSfoKsMXdz5GgfCAfo9Rn8Uanh9Sc5p+w5Pwiwef4=;
        b=DDJ6jwT56s62yWeGK/CmnDsCe5tl0dce79XjMyHffCfTfRLhUpinczieCYWBBoiSpO
         BzITZ0zk+PpXYzSU0nle6QospMlCq6WL5erGa81zZLS5qqUw7OovClJJcLDY8O5B2/8L
         FktdLR1lgVDk8f2BvHHLlHclHchbL4wvklB+iCKur8vTaz1/k1Y49Wxxoalf137368MQ
         ewiRtsUbzOKzgJ1/YvpTUOEfh2Gi9RO1EdybpKoa30ULztiwulsU5prqM71jbEsc5VTm
         zZBrXw8L0F0pJb+L1zY7zCf2ls3HLeUIpIPzPWCJ/JvWU4hcTGmGfXnSx9XRGtAWFlr5
         FF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755665945; x=1756270745;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4tfSfoKsMXdz5GgfCAfo9Rn8Uanh9Sc5p+w5Pwiwef4=;
        b=TZSXHQJcdfHgiLhcq+34rc8AubDU6AWbVl9JyO8PjYDaAmS1l/Qof1OSTb9gmrPWm3
         Ujx46v3K9jkiqGC8d56kRBg4GJaE4m5tFofw3hM3FJikcdMKlaUVPz5esMTe9fRItY3x
         4onlyzYR8FcHIjsWaZvOcrYf93Il/NQn8VEH1wKz+IXgldDcGy660KDlyGybBeyGiu3H
         5QQnK7/Nwn6QU0W3b6Jp2t/wvY/y4z+j930Aa0CcJrl1VicuIaBYlVkf78fC621cWGhq
         OBx+mO2Sq3yn2l3U9R5Tn7NPSMByBC2/jQ0xb9uIcHs5XgoO20G5OR4Bgn/d+rRcvM7F
         yJ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWohJ7cUvuhdvlxMS8V13iBtA8hI+Td8/O5J6DD6AjBMi3kvKvQZn1iRrEEj9iyTjGZC+zXYxC/AWjf@vger.kernel.org
X-Gm-Message-State: AOJu0YwG2MiRgSW3R2CAd6WEe/bbsAxz3k86To8SoskUPCrNRfaJ0B//
	OElNmlYqptn2PKElIojs3AfVCLd1UQEYH+x8YlvfFo3Y85Y94H3pRdjTzSYOS1tgdj69bFpCXtB
	1J6Zv
X-Gm-Gg: ASbGnct/GIfljXqFNCxA1fki1ro4IYbePYLRn/BV3TlBVpGfxd8xBDLlH79K5963m3N
	6bG5B7vh/C47CaE+GgLJMF88olvioExKCASJWrpoE18Oe0AG5/LAupMOnUSl+isOy365B0rRc4W
	WTQW558ZXDhS/X5yMRuBbT7yE6mMxkrcAty4va454TpfH7grkvTz40CrnhoyKUjwUFtZffKjh0t
	6wbusqlvdeeimd2TqLicX+crtEqcvemZs5CZuSi+1Aj1w0qt4InkxiaiZ1bcuN1GqA/lSKM6ce6
	snMt9cHVsLIjGaDRcHWIB3/D5DzMUlvfNXcL9OI3ZH50dUWjwD1H7sxf7PqW5JDldmkT38xJAiW
	LoC7gS6x12XLe7KzHu56RHifA7Gs=
X-Google-Smtp-Source: AGHT+IH5n2CWjcSZOn0HA3+8ZPCriEB/bYPKg3/1z8xPjtu8D49wLyKlFGTXw6QYWCr80KS1RxTIVw==
X-Received: by 2002:a05:6300:210d:b0:23f:f659:a0ef with SMTP id adf61e73a8af0-2431b884c06mr2444023637.25.1755665945324;
        Tue, 19 Aug 2025 21:59:05 -0700 (PDT)
Received: from 16ad3c994827 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d13d2b8sm4108122b3a.46.2025.08.19.21.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 21:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIOKAmHBpbm11eF9nZW5l?=
 =?utf-8?b?cmljX2dldF9mdW5jdGlvbl9jb3VudOKAmSB1bmRlY2xhcmVkIGhlcmUgKG5vdCBp?=
 =?utf-8?b?biBhIGZ1bmMuLi4=?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 20 Aug 2025 04:59:04 -0000
Message-ID: <175566594376.96.14788012312958235521@16ad3c994827>





Hello,

New build issue found on next/master:

---
 ‘pinmux_generic_get_function_count’ undeclared here (not in a function); did you mean ‘pinmux_generic_free_functions’? in drivers/pinctrl/qcom/pinctrl-msm.o (drivers/pinctrl/qcom/pinctrl-msm.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:4466df3c987ba2945eca05fcb2f3c22e97d8636a
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  5303936d609e09665deda94eaedf26a0e5c3a087
- tags: next-20250820


Log excerpt:
=====================================================
drivers/pinctrl/qcom/pinctrl-msm.c:265:35: error: ‘pinmux_generic_get_function_count’ undeclared here (not in a function); did you mean ‘pinmux_generic_free_functions’?
  265 |         .get_functions_count    = pinmux_generic_get_function_count,
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                   pinmux_generic_free_functions
  CC      crypto/lskcipher.o
drivers/pinctrl/qcom/pinctrl-msm.c:266:35: error: ‘pinmux_generic_get_function_name’ undeclared here (not in a function); did you mean ‘pinmux_generic_free_functions’?
  266 |         .get_function_name      = pinmux_generic_get_function_name,
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                   pinmux_generic_free_functions
drivers/pinctrl/qcom/pinctrl-msm.c:267:35: error: ‘pinmux_generic_get_function_groups’ undeclared here (not in a function); did you mean ‘pinmux_generic_free_functions’?
  267 |         .get_function_groups    = pinmux_generic_get_function_groups,
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                   pinmux_generic_free_functions
drivers/pinctrl/qcom/pinctrl-msm.c: In function ‘msm_pinctrl_probe’:
drivers/pinctrl/qcom/pinctrl-msm.c:1587:23: error: implicit declaration of function ‘pinmux_generic_add_pinfunction’; did you mean ‘pinmux_generic_free_functions’? [-Werror=implicit-function-declaration]
 1587 |                 ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                       pinmux_generic_free_functions
cc1: all warnings being treated as errors

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.6/arm64/chromiumos-qualcomm.flavour.config+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68a55241233e484a3fa286f1


#kernelci issue maestro:4466df3c987ba2945eca05fcb2f3c22e97d8636a

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

