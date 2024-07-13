Return-Path: <linux-next+bounces-2982-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E489303A6
	for <lists+linux-next@lfdr.de>; Sat, 13 Jul 2024 06:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 181E51C21E60
	for <lists+linux-next@lfdr.de>; Sat, 13 Jul 2024 04:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F7E18039;
	Sat, 13 Jul 2024 04:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="uwbDWDz2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096F21759F
	for <linux-next@vger.kernel.org>; Sat, 13 Jul 2024 04:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720845325; cv=none; b=m28cLsuc8mX0FfXcyPv2+JWIz3/Sm/L9QAKWqkcARSjIwttVTQi7bpg8cojapIE5sDHahXWnixTm8pWkIZQ/7Wneg4Mdz05wKrCtdKs6CarMp24Dg15tZK7yuFg9nyB0tLM/ncRuoSGFYnEMSCoEnH7/4jZGUlAP96WZYtnqH6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720845325; c=relaxed/simple;
	bh=lKgzL+30qZf1S4Wd7pdx8pYaBsMqWB2klohiFKOshAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PVVhIzUu6uKUK2bbZ8vOXH91jB3otuVNNMtlvZRrhFomwE2mUUKDVGpJ7H9EB42JNjVlG4IsS5bX6XMDeL0HgbBp9akRTd8f36/xbjpcDQ7AnzUSv9MNAY63ACzGpRl0pWkK3atzpS/muNHUJfpoHyKD5q+4GX7vQgpqaVO1Y6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=uwbDWDz2; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70b702be5e4so907032b3a.0
        for <linux-next@vger.kernel.org>; Fri, 12 Jul 2024 21:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1720845323; x=1721450123; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lKgzL+30qZf1S4Wd7pdx8pYaBsMqWB2klohiFKOshAI=;
        b=uwbDWDz2lw7zGGqpDP6tBVJJxUZx01XB4j1l28c4AmpUMs3X3FGEMrAbZi840wIUF4
         f/bqWZIp9KsbAGlv46kjWgPFY6dFdVHZM6jXxi3E6hnuqlXwTDtedhCjFnWDBvpB1fJu
         f781/yy1JPUkzmumyAb9zH+d8aFo941Dq8mzyGQa3S3298JDbitNw6gsmsIrGMzRUA/f
         GyCe0IrGoYbKDQOaBCBPXDkmUWGQZHknAQIOwNFY7CQRjd2MKXaMZH+sZE9pFYmMYV+f
         KD2HOOq6Dqx+eyzOhLAqR38pw+I/Ukgn1YWWCietzgUlUetQv1CikNfMm6/a3pXyEkPi
         Zidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720845323; x=1721450123;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lKgzL+30qZf1S4Wd7pdx8pYaBsMqWB2klohiFKOshAI=;
        b=WsQqscCxMAcVxvbes6Nk4EiCmAInN3mnywJa8+X14PxN1p+Os194FHsGCwKJmFkFQM
         C8TZDcngYZi4RMUyfae8l0usXenVGcQBKGu7rVKcDV7kBbZqJh9GhteqmFrLIi8aMH1G
         DHgj7M11BZ86Q3DeYT/Dy+cqlMZsdkcRP3FbjhMJuLTdZzJ8eyTh+7ASeYbZnd3zQc1V
         B4oo00A8BNPYLAQdtrWfH0AXOB0RqPO43Z1LHYDoJeuyOr0ysxy4ob9LJIedAeCGTl5C
         3odtxGoP3eCwzjR/XQRxmHml37eQaYEA3k+KnfXWZLMiX8VXyWqeWRpn/E3FJjeMeHo2
         03Lg==
X-Gm-Message-State: AOJu0Yz7y3pp+VNbJbQEpGosbkea1465npe43aHpXw2MQQ/DatX0lDl7
	7M9JIMFA5FjFrNEWZU9cyO3b4I+Kf5QuBQnhe8SGdvKx7Sau6iuDHygNR4BeYkU=
X-Google-Smtp-Source: AGHT+IHlsTG9y4Nwef7rgZ1gxDUSR35+wfEMcc0fUV/pYgNzESx6ymbYMYbGIKdWBI+T9U1MrE7wJw==
X-Received: by 2002:aa7:8889:0:b0:706:31d9:9c99 with SMTP id d2e1a72fcca58-70b43362a47mr17227141b3a.0.1720845323274;
        Fri, 12 Jul 2024 21:35:23 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:d7fc:57d0:ada6:13b7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e34d2c533sm230717a12.45.2024.07.12.21.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 21:35:22 -0700 (PDT)
Date: Fri, 12 Jul 2024 21:35:20 -0700
From: Drew Fustini <drew@pdp7.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Add thead to linux-next
Message-ID: <ZpIECMEzy1srRfe1@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

I've taken over the maintainer role for for T-Head SoCs [1] and I've
set up a tree that I will being using to send pull requests to Arnd.

Please add these branches to linux-next:

thead-dt-fixes git https://github.com/pdp7/linux.git#thead-dt-fixes
thead-dt-for-next git https://github.com/pdp7/linux.git#thead-dt-for-next

Thanks,
Drew

[1] https://lore.kernel.org/linux-riscv/20240620162522.386-1-jszhang@kernel.org/

