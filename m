Return-Path: <linux-next+bounces-8144-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD42B3C1B7
	for <lists+linux-next@lfdr.de>; Fri, 29 Aug 2025 19:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5196F3B4905
	for <lists+linux-next@lfdr.de>; Fri, 29 Aug 2025 17:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5714F33CE81;
	Fri, 29 Aug 2025 17:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnrwJDaz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BDC322DC9;
	Fri, 29 Aug 2025 17:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756488432; cv=none; b=HLMrNqKTNJ2UreA8cSAZqXW4ddo6KsAvNZn4kfVVRMT9L6D35Kv1qK9q+ooGi7nssRqQqfIUmw/B0WrP0ljqc2m9nB4QLfWdIUt2y4X0sYb3Cx6QVddKM9OvirAkPcwzRpTljTV8fpXNLPmL0khzKlVYYm/62rqs6aZ4eyto9+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756488432; c=relaxed/simple;
	bh=RGSJRAyOHfPvPSS8o2YgOQeCl7yVuK4Jf62T4gFy0cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jB3Sa5KOmo6WV9LkF4qQQ1NUN3bTTzIY1zmlQlIsUL6cUKddoNRX9MK5hCgyWU+FdJhekD0iE1v7vLj0vi/0eIUtel50CFoJHT5I0eCJBU5RmtHIgjhmjT4Tah3l6fvpnUjcHMxikU4SFfbbefE5nJuAHHh5fe+utQCHL7Dp4ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnrwJDaz; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-244582738b5so21492605ad.3;
        Fri, 29 Aug 2025 10:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756488430; x=1757093230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGSJRAyOHfPvPSS8o2YgOQeCl7yVuK4Jf62T4gFy0cc=;
        b=YnrwJDazqgyK7QBwbCRrejbu918s6A3k4wnE45G8/iz0EjdoQsnJ2n5Hj5NZKcxL8G
         OuSfbcBlOQMN5hf1ugDkXSZHTlAhXqdiLK6qPiKAiTL+5e9BIe8s8XuW+mRLiKhvIkpz
         +Rx9efHdZ4gTQn4DevdXkODhEsiECcnKYdqPAXMr75iD+PDfgP3Ok7d8iWgTF49AHdIb
         iYVGFdc35irhw9w0z7JpXmRrtIhBVK7IKd2BbNj355V7ShTHS+97qxERIvJ7d3CSVKb6
         rNgR0bAWjzZXG8teBqs1Q0z7YHeBDtJCCd5JCimkfoFcC7hvfaD2lpPMAUIOpcIJrIk+
         n5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756488430; x=1757093230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGSJRAyOHfPvPSS8o2YgOQeCl7yVuK4Jf62T4gFy0cc=;
        b=DYl48wnyKDBemszS7kqunPIMWHXRvYBlyRCUo3vxtm4Ex3sPIKFiHUFa0Zl5wV8oh+
         IH3bHgf1VGtzWXvyNufoxpB87Si1I7/oWaKSpTYcmuJnI5tURXDuuUKLyRc4XCibKkG3
         oT/zHOrO4/5EcziD2oF1zmwNS6brPYIrtg8cq2NfU3Rn1zsOrGPSbM6+AiEXLptbTAPr
         mcViXSaiktbSYgCsxpMXor4i6krzDB46XxUMwMfDaG0jZDTOzAUPZ7IGWb1JpGHq5iRs
         bGsSUIOOUmxhxqG2Mcf8s1uV2UGo98o0f6qq9xKzhiLXV5u0zg+YINV/wj9H0xNFkkr+
         g63w==
X-Forwarded-Encrypted: i=1; AJvYcCUOYqRia+9AbI6K9qwI2L3X2ChZDvxZboVHvwqRx9hqAI3iJICaeZeXdxHvSwzjaakmcwoXdHLeiWLZhg==@vger.kernel.org, AJvYcCWJS9KkLQ2bESGJWpg2ydOZ3yH/0tlTWafJdtk8fOHcT7anGcsJ+FC4WZJI0NO5BBBLFHOojl8TcHNSnfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMComJ820visunORGQNfO1rzNZwQuJ/9PLHWcTPvvw4MBvnbxz
	BIYz7rX92Lat3cIouAQUcBIRfkq3UDEzzgxvFvsP/fAyvvT5KTEkoPFP
X-Gm-Gg: ASbGnctSBb/li48mWQKKi2vf8NX7hKHy5Un5hSCSdld7pvVREqZwu9pA2gGKZBiXFJM
	x8pSb5Fqby4JWb5VD+gMYCRZ0826B3uXmFAJcZGYM2Uvr/cn8+StllDWBVJuCSq8oNSlrP3Q2jx
	AK3rZPb5aQZYo2oXvNoBTFCkNi5kHLhsu0UgTDX0shnRMEstN7AO/JW9CtA7YJlxS01EeeFodzH
	3EuzoBPomKN/6FsNB7l9zqEeitL5JX6gU25Ym4FFnUY0087GA7aC2EXq0LGURkW0slWAzFIRmXu
	BsO7wwo8zUilf2ncd3umTkeb5yv80IoIWPjPIg0+C36rZkAoj4e/M3OyfT+iX/3eTLmlPvCzHfN
	TCzdnZLheK8q8mPip6PlfhOgboqV/5GI0gukmN+ampflE1QD8ejNatQjIlsUV7sw=
X-Google-Smtp-Source: AGHT+IEirw3b0LiweDIQhLxDsQn2+vHUM9dfTgVVqo+arDRn2L+fN4YRUaqpWcIiA3/+zPoAXOH8cA==
X-Received: by 2002:a17:903:2bcc:b0:248:79d4:93b3 with SMTP id d9443c01a7336-24879d49799mr168491395ad.59.1756488429831;
        Fri, 29 Aug 2025 10:27:09 -0700 (PDT)
Received: from lkmp.. ([157.51.63.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd33c1sm8645580a91.17.2025.08.29.10.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 10:27:09 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: sfr@canb.auug.org.au
Cc: dan.j.williams@intel.com,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	rakuram.e96@gmail.com
Subject: Re: linux-next: Signed-off-by missing for commit in the cxl tree 
Date: Fri, 29 Aug 2025 22:56:49 +0530
Message-ID: <20250829172658.5602-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822091206.7d0d57be@canb.auug.org.au>
References: <20250822091206.7d0d57be@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hello Stephen,

Thanks for pointing it out.
I mistakenly placed my Signed-off-by line after the --- separator, so it didn’t get included in the commit message. Sorry for the oversight.

I’m still quite new to contributing to the kernel and learning through this feedback, so I really appreciate your patience. Would it be okay if I send a v5 with the SoB fixed?

Thanks,
Rakuram

