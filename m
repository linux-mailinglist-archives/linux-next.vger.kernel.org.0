Return-Path: <linux-next+bounces-4407-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DAF9ADAEB
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 06:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10368283398
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 04:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3C1146D6B;
	Thu, 24 Oct 2024 04:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=safegenericpharmacy.com header.i=@safegenericpharmacy.com header.b="Kcq6iomV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D1323CB
	for <linux-next@vger.kernel.org>; Thu, 24 Oct 2024 04:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729744298; cv=none; b=bHB4h484Ut+reom11KwRDsJ67nAch1NgGQrA47ZwoVekk7qRD2k+qHLAcz68jurWzDq8b32Ikitj0Vz5LlQDfJ2duTiDqtek8D3nypU8XwzVERMNHWq+PtzbYiq8bq7rN91ASeYEzK/gm3+pXUVldHfSwh8jC4uuEMYnY8iRrz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729744298; c=relaxed/simple;
	bh=+m7dCV1kOrwYZ1lXc86XHAXddJSLfFpelE2O1sV/jDI=;
	h=Message-ID:MIME-Version:To:Subject:Date:From:Content-Type; b=YZDbVOhWUsnSHYcXHqdvCqQirigSuZ6gKUC7uPib47lFYbeQDgCSduo3ci0f0Ls9RKprBjKjmtxkTKVAo9X2gdzz5TPoO21BPIbd1Jsn77lpkqlx4UsUAxFhdXrcleKkP/Jwsx+z7oXKxYjUfGTOyDMpECX7tGV10Leo5idtgHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=safegenericpharmacy.com; spf=pass smtp.mailfrom=safegenericpharmacy.com; dkim=pass (2048-bit key) header.d=safegenericpharmacy.com header.i=@safegenericpharmacy.com header.b=Kcq6iomV; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=safegenericpharmacy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=safegenericpharmacy.com
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-7b158542592so29732785a.2
        for <linux-next@vger.kernel.org>; Wed, 23 Oct 2024 21:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=safegenericpharmacy.com; s=google; t=1729744295; x=1730349095; darn=vger.kernel.org;
        h=reply-to:from:date:subject:to:mime-version:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+m7dCV1kOrwYZ1lXc86XHAXddJSLfFpelE2O1sV/jDI=;
        b=Kcq6iomVmK4/f6TKn1Ou7QpjVOzCCBB4NMDqAtmAGSehfvEnnksQUueunvNuT/tZJ1
         2+BqV/kP3cHmKB20lxxKovkD4FAk4oLW5+MLxx1wDyY6X7eF0V9Be4uZKBxlkyoe3DHt
         FypeuPA70VV6GngESlrfrj8/4jvOZgfAX3jL397xgu8I4B+dP7UZQHA+/c8TEG/UVjtV
         kgk+3mkH+Oa27a/ddrgcBErzOx1bPXJ4cVs2FvZNaPp/bXoZVulDwQGsgwncrTTMhl5a
         WizZJMjW1U/sibDIosjTBhqxgZQ+pOQlhSnbGUqPhrGkDyM9F/hzt0V6Qxki+m/7JqmP
         XfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729744295; x=1730349095;
        h=reply-to:from:date:subject:to:mime-version:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+m7dCV1kOrwYZ1lXc86XHAXddJSLfFpelE2O1sV/jDI=;
        b=kiEvmXQ+iqWK4J49rKPaASGHlQUwF9H54KjAYu2kemKBj9HR+iq0KtCZNCY8N1n9d5
         llbHG8GP2JFKlbl5xk5qZEvQGSE9lmysUvM4g8VELOc5lzz+CXAQYl7UX3zf2oIWATH+
         Njrmno0msF2szmt/cAv1zy6TIlI4I4WrsseCIXTtBsT0mdSmwk7fMRMPvqByedAjGNh0
         9sup9a3qQNnOYbAblwl66Y+bSVfIZWfB/hPLAe0CmKHMIgnVKO5Nujq1PUQvYk/L6gNU
         NV51QvMI+CRlrMWq9P6ghrRS6aDvCmxV8e8JI7agBfpLYk+mlAzHKgPIWpFxme4Iq4f1
         brdQ==
X-Gm-Message-State: AOJu0YyySJlugTknQuEJv+90/Wa1f1Y5/qzZRUMpGYYezDIwqmn1OXlR
	HQp5H7DJ61Q0x3I2GH38EXhcnng22FjE/I2RefzHNzTW04jeAJMpCN0vBfzTiVwjR+gKNClCO6f
	QQJMc34xp
X-Google-Smtp-Source: AGHT+IEsdFOEZZ2BpY1JqIn7FV1ZPDDVIGzsniQ5zL21OcBDEJ3YoRLTvTbQuRrT4t7UkTTtUIg1Vg==
X-Received: by 2002:a05:620a:460e:b0:7ae:3fae:a260 with SMTP id af79cd13be357-7b17e5c9f48mr447001785a.66.1729744295344;
        Wed, 23 Oct 2024 21:31:35 -0700 (PDT)
Received: from www.safegenericpharmacy.com ([178.128.144.137])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1659b986fsm448257785a.20.2024.10.23.21.31.32
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Oct 2024 21:31:33 -0700 (PDT)
Message-ID: <6719cda5.050a0220.2ef3c7.028e@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: <linux-next@vger.kernel.org>
Subject: =?UTF-8?B?U2FmZSBHZW5lcmljIFBoYXJtYWN5IC0gVGhhbmsgeW91IGZvciByZWdpc3RlcmluZw==?=
Date: Thu, 24 Oct 2024 04:31:32 +0000
From: =?UTF-8?B?U2FmZSBHZW5lcmljIFBoYXJtYWN5?= <admin@safegenericpharmacy.com>
Reply-To: =?UTF-8?B?U2FmZSBHZW5lcmljIFBoYXJtYWN5?= <admin@safegenericpharmacy.com>
X-Mailer: PHP/7.0.33-0ubuntu0.16.04.16
Content-Type: multipart/mixed; boundary="----=_NextPart_5bc287fdbc707fc6a90bbbc02d1edce9"

------=_NextPart_5bc287fdbc707fc6a90bbbc02d1edce9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Welcome and thank you for registering at Safe Generic Pharmacy!

Your account has now been created and you can log in by using your email address and password by visiting our website or at the following URL:

https://www.safegenericpharmacy.com/login

Upon logging in, you will be able to access other services including reviewing past orders, printing invoices and editing your account information.

Thanks,
Safe Generic Pharmacy

------=_NextPart_5bc287fdbc707fc6a90bbbc02d1edce9--


