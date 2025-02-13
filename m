Return-Path: <linux-next+bounces-5437-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAB8A33A63
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 09:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09A8A3A2134
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 08:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE0620CCC8;
	Thu, 13 Feb 2025 08:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWyx397J"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4704A20B20E;
	Thu, 13 Feb 2025 08:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739436966; cv=none; b=qoqw1fiqZObsdmOTWD5xwhOfeuUBvd00Z1RvxOSDW2wN3Hnh3aNyFXNayqLgWgz0/Zk90gnCY4UWGA2bRpKTf75U92+DwrSQ2Zu/jNsuUEPNvZqNGl1HIZiYnvzPJ058tRjE899WNqZr/lo/KKePdQ+A94TlA5ipR3roq6BQeu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739436966; c=relaxed/simple;
	bh=VzJ8mzMtg0VF/N7v7BKnBiXAXYeg/wsIV06ZO+o3aKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qui/e6Dy4Asn2qadQd0eY4Oapqrb/UJOgwIc0Vd3I3jBH3CJ+vTqqsBpTw3+x1rQTVt7ouCLnKmNHnw/tJgCtbU3BpmycfJM+iYZFej9G2zrmzDDN/uie1i2gR8jbEPYWFvG1r4K8lkjzVvkOA0L04lkFQ0LG4gnSIAEOZ6Ehu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWyx397J; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab771575040so349560566b.1;
        Thu, 13 Feb 2025 00:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739436963; x=1740041763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xPuFBsCSVoD+xcmX67kIpEiS1D1ZaBsI+2yMrUgbqbM=;
        b=WWyx397JNTIOGRQGacfXhYvgZietR6BMk1G+cxqlBW3Rq5fCGPgJq4ItrDvEA8ChK0
         qX+ciH9QNmUE1rrwBg6XleeMe/wH0SerBXpnXN+prYHT7Ax+7ajFHgZCy+rg9pqow+o3
         dRpv5+TA2h6iVhj6a6yB6+VGprAl19sSFKOMmGA1b12qyvCvwbKI/2Jr2p34hif/d1ya
         17T0+tevXomcE4lNkdcTAQOeg8FFV8VFSeXUinObIooEwCLYkva7jYYLnNShHX7NyM/d
         fM3abOah2agcN9FKh1kNb54OeAJihagd6hFfRpKgOyzsSlUnguiGrA7sxuIyJh0dJlEZ
         Jq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739436963; x=1740041763;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPuFBsCSVoD+xcmX67kIpEiS1D1ZaBsI+2yMrUgbqbM=;
        b=cBpEhgmQFlFA2eqMb1OpPtJkOBZT+PdW7n+LWmP7qLTNezJbpec1fqvRZFNKqprQLW
         VLpeZVC8N7KMcZi8JIHSwKJ8AE5upidj+GqSwb8p2xSu+X3c3Mn8/h7SAXlFVEAqwY9j
         xru3qyIOcTbI212acup2Z61L7/N80ioCCJ+xUPVyiE6seCLbvvpGQBmz0m5eywVhLrzS
         InvQ7CW5+JD39i9fylDlsyDXIq6KCGeUQwhoKj+Q17iZs2UsVK7b/NcCHh6+hClRZK4u
         jZVk542LeL73czz9po3qQRJ4GvVyvK2rMYZcQ9/d1zCwsN1K38xOiYwIeNr63/NAW5u8
         DSDw==
X-Forwarded-Encrypted: i=1; AJvYcCWE6/DsS3Z7LsLy21FNXC0vGjA9yWFk2sawq3c5rRqRr8CKg6TtM+OK2bhNV0SkYLPa9ZPKzzlMYA1A@vger.kernel.org
X-Gm-Message-State: AOJu0YyGuy5PiQrQ1ov0/UrRwmhC4iByhz2CNqTTxJCbnl63LhQoL4gH
	2PUHlhnTDckhtS1Y8seQOek9YDoEcYWpQUVoVAx5XYylM12fmhHC
X-Gm-Gg: ASbGncs4++fOPP6nb6QcmMjHpNUbxUz+M7H77xByiwml9c7BuYtfRqtMMT3dTJdfSIo
	CvrtAx+OV8b0JZkdTCviuWB943H9UtTfmrltcsXpx4IaFx2BvVue8NQr+C2PyLL1KCANr5FvvwW
	++zYrm8IkhxfljYU3HeHpfHSJg2kQCLz8rP2pfVmyLyAhr5YJYdmAKp+b6kLFSMbDa8A86TTR0A
	Y8f8inXElbrZ2ZNqZmIs/u8xxBmm6XyeJQcF5FxKgBwaVFoQGCaaUJLm81blZDDeWk70RzL6nha
	cDUvaUck/KoJ2ZrfWQk=
X-Google-Smtp-Source: AGHT+IGTLJ1TzfQVL1W7w3T6PH+I6Gvx1UbwD+CQSAdOm+Omf8MXJPVdWjhmv8ZQHke8Y5nCuE0K1A==
X-Received: by 2002:a17:907:6d2a:b0:ab7:c9a3:a3be with SMTP id a640c23a62f3a-aba510de32amr185191666b.23.1739436963259;
        Thu, 13 Feb 2025 00:56:03 -0800 (PST)
Received: from [192.168.2.177] ([81.0.8.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53231fd5sm87685066b.26.2025.02.13.00.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 00:56:02 -0800 (PST)
Message-ID: <9288348b-5792-4122-8705-76c00e463eae@gmail.com>
Date: Thu, 13 Feb 2025 09:56:00 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the mediatek tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250213082522.52ca62e0@canb.auug.org.au>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250213082522.52ca62e0@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/02/2025 22:25, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>    c4d75a56d161 ("arm64: dts: mediatek: mt8188: Assign apll1 clock as parent to avoid hang")
> 
> Fixes tag
> 
>    Fixes: 4dbec3a59a71 ("arm64: dts: mediatek: mt8188: Add audio support")
> 
> has these problem(s):
> 
>    - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: bd568ce198b8 ("arm64: dts: mediatek: mt8188: Add audio support")
> 

Yes, that seems correct.
Angelo will you update v6.14-next/dts64 ?

Regards,
Matthias

