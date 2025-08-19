Return-Path: <linux-next+bounces-8010-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA75B2B9F9
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 08:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4414E7B1327
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 06:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90AF212B28;
	Tue, 19 Aug 2025 06:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yo4T5DgQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1122765D4;
	Tue, 19 Aug 2025 06:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755586603; cv=none; b=tOdPvQJfmztjQd/VuSk6+R2MwL5bP/8DFj8dcaZ4OOi4MszLwAsm5IWHByTQcRUt0PZkhtx9ZKj9FjTUR1C6gvnHohQGYkMvcWEnCHgDhZLEJPSWDJzdEJZD6ViLA+vIaha4Vcrg2hjjD4Fhqoehh3APgrBqDMwYA/RDjPL6Z+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755586603; c=relaxed/simple;
	bh=vNXgdxN+kluD/yWOhq924Fn3UPJmWPDAIuAfll0YTTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KlSHjzk4VeOwEs6plUmk6+LyPZYsnNdE0wRfcFBIYCHsZri9sbVR9TuZW8cO4ARY5VHfYQ1JfgnI6U4eJZ7KydOwCghvBAOp1fenK7QkLkzBqS8BB/U1c/ntNZfIQpYDbsyASYLJW1fXgpWMfR6Oo1CcfpuDQ77a63ArF6CieZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yo4T5DgQ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24457f581aeso37776145ad.0;
        Mon, 18 Aug 2025 23:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755586601; x=1756191401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkWkn7qInL7a6O5o73NNNgB4L+lhSZNkbw93KfVeFnQ=;
        b=Yo4T5DgQapwOtCz6DU9nIHWLJkWKKtfBsAQSCqMauCxtJabfWfICTcsStJ9Xf5HmiK
         6gbyHB6UKHMbdEuPbeAA8p14twiydnxJDUD8YHL/qwiJ5NNhVVDVUzkjBC1rI0fsTRPC
         kCbHZYtuMPk4TES6nyLqxX/6Mlhldcuevl7mRUUEjAY0d7CxL7tBSzty+VDAEh4VHFwj
         Rn8nZj3VdspooxgSb3Jbp+9j3yglRo96COd1ffHPCKjyKGbXI8GA26mHkRBVF3feXaCj
         jqTPbG01pBAIKMLEY1rhdETmvpSS2f7dMGs1gs4GexaCXykXMOtOSaMZHQfGoypWVdRr
         ER/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755586601; x=1756191401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkWkn7qInL7a6O5o73NNNgB4L+lhSZNkbw93KfVeFnQ=;
        b=MfjiRWQJ2KvuTUJBC0tBErraLf7ls1aGlvD9w7p7HwZ4h6pYgppZltQpZh7PiRSntP
         +d21/h4+MlpjfIlRZjcNPpvhKF7BQG+Pn8KFTLNQp9IgdAYDq60j16vQMDSMmtr/yUji
         IBsZmAdlzrh71onVMvq0DJym18OAHLe8u9QkjM6yqVNLK9p0KkVy9gNeFtY3I4sqJAaU
         72DS/+6IMnWNfFT0oGjvvfzDbZVWXTUM2dgoGrtSB/7Zlvrm+v6avKNMqMljOaPKemGK
         4mwMarFeF5rRY3aBMUPSL51t4knPwPQK7VJYRKweGzlmX6FnA2jjbZA28LKW6D995VWb
         xgXg==
X-Forwarded-Encrypted: i=1; AJvYcCU2JR/P3HHXStyMkWxSQTSIeyTo3e6LIc34UMClEQ6CxiCT/v/o1eY1QFgMKLq3qaW89KzgKjp+S7XB5w==@vger.kernel.org, AJvYcCXa2p7aMqADkr5JQEV7fBkZ6G7ixtsO5jaiF4KedOYlWew0o8czpXfhrlN1F+LcE3/+7iR0uHdcuZ38TrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqEnIqSbxfRtXEf/2tqmbtuLitD65hXH1VmitC/qDzOzU+GTpf
	FFUW6naZu8NcGE2qltVfmPdi4g5EDFrk9SXijOlOK7//rVnqOK1aPDxh
X-Gm-Gg: ASbGncv9XSF3stD6ZmqqwW/YIq/inmdggwnVYeVBdvy7OlTJUvT4kEOUsl65laxb49D
	x0nC4bTLCggIaq47FBBD9jrrnl5vKou72DculziKrWDj4akNoaHQuqJtdvg6HfGV8mi++Ndz/dA
	KTPyxD1IFpJ0VaLHvhaTG5kvvXmiCkIQNQyKZ/vz7FfyqJcfLl71zZw2VEHOXTszYV8XE/1F8Fp
	SSTu3ZMDkE4BLR+HxK6Id53emFJle2MQdGduwbu8PO2Ss7BxR6A7XN9ko/Hxl+Q1bM2lKYkO4X0
	h2D/Beu10atEoaNTtism5FGMKmwNcKuE70o2ykN6p71gYKtOmP4YHa7w7IkwoVFaYUn3mhqQWK6
	1kjNYA8ZW+zPVXarNh/GcJ1Bsx/YWckixF3d5Nuf2
X-Google-Smtp-Source: AGHT+IEVq7SABUS+vJlZ0PnQScyaOjgU653Sbpd1EGdtwq4fQJrl7o+MKVKfmXyokFJqc3zVVWKRcQ==
X-Received: by 2002:a17:903:4b47:b0:243:3fe:4294 with SMTP id d9443c01a7336-245e02d5107mr19354335ad.12.1755586601498;
        Mon, 18 Aug 2025 23:56:41 -0700 (PDT)
Received: from localhost ([192.19.38.250])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b472d5a6e01sm9765490a12.3.2025.08.18.23.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 23:56:40 -0700 (PDT)
From: Xing Guo <higuoxing@gmail.com>
To: sfr@canb.auug.org.au
Cc: Jonathan.Cameron@Huawei.com,
	l.rubusch@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	shuah@kernel.org,
	Xing Guo <higuoxing@gmail.com>
Subject: [PATCH] docs: iio: Fix unexpected indentation for adxl345.
Date: Tue, 19 Aug 2025 14:56:34 +0800
Message-ID: <20250819065634.1154322-1-higuoxing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818124124.5b978e64@canb.auug.org.au>
References: <20250818124124.5b978e64@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolved the following building error:

 Documentation/iio/adxl345.rst:161: ERROR: Unexpected indentation. [docutils]

Fixes: fdcb9cb9178a ("docs: iio: add documentation for adxl345 driver")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20250818124124.5b978e64@canb.auug.org.au
Signed-off-by: Xing Guo <higuoxing@gmail.com>
---
 Documentation/iio/adxl345.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/iio/adxl345.rst b/Documentation/iio/adxl345.rst
index 4bd038cb4a37..afdb35f8b72e 100644
--- a/Documentation/iio/adxl345.rst
+++ b/Documentation/iio/adxl345.rst
@@ -157,6 +157,7 @@ sensor terms, free-fall is defined using an inactivity period ranging from 0.000
 to 1.000 seconds.
 
 The driver behaves as follows:
+
 * If the configured inactivity period is 1 second or more, the driver uses the
   sensor's inactivity register. This allows the event to be linked with
   activity detection, use auto-sleep, and be either AC- or DC-coupled.
-- 
2.50.1


