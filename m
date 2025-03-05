Return-Path: <linux-next+bounces-5650-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 360B7A4FA99
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 10:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81111189257F
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 09:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B203204F76;
	Wed,  5 Mar 2025 09:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9wpaTGD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5912AF19;
	Wed,  5 Mar 2025 09:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741168251; cv=none; b=DkI/2N9LxSFRzGtI0rZnDUl6LqBSUCkC9zU2XjE9Ylo8yerMHFJlQXgEGUfIqkdkEKe+EVDedrr9Lqk/dIwFsh4MnsHSTs7sRO4zQtoI9hHN4AFgDh3BM2cePTq1L/NtriKKfcurH1LN0uWdArF1+vWhy4ly1mtrwtLuMRS6Rqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741168251; c=relaxed/simple;
	bh=hnJRTEp2XkZ9SG0QTXH32cGwhu/TM3DNRhvETCrTwC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUo8TmsihWj/5hjP3EXsBYY2okC8yLNqrHg8IXwFloopPLdpC7Fs1cY/CwbutioYo+dVqxgVqb6/c3PxPwcu7seempfPaWplie8vG7XAO5dQGa6laIRXA6qBJ7Mz55ci/CgXpNHCMXSuzrDp9BnYA9Civ0kbRmoNxnb/RvBOpZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9wpaTGD; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e4d18a2c51so800777a12.0;
        Wed, 05 Mar 2025 01:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741168248; x=1741773048; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sy8FAWYaFbmXAZB/as+Gcpy61NGKNxmQZzWDH9kXc+I=;
        b=O9wpaTGDsdHCxZTwCQhxgbEKPXrrZG+u1XcTwX7M9dVRF45yine0eBvK+bVuKUiOo/
         YBukbzFAOKLpyO+2YVqr/JWAnMEr1KjktyRQdE551dz2Ze6uDhv74qPJO2rH/UZ4N1oE
         u2N9pOPqoHVQrn9pxUD3ciBL2IEcsUlP+AEUrzOgz8V0YvPxvZ0QDTitVlMHk3+FkxFQ
         YVXl5c05RtuSx7nO/Gd+5E0j3bmYmqqwDRKP3yZaGClmJYJoJq8fk8E5TMT1y6fDzDMr
         Lm8jLm4tMXwP+hkYY3w6uS77xI6pXCfmdRTRJv9Z/l3kgA+e5lCuLrJLWuD743c1uAOC
         BeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741168248; x=1741773048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sy8FAWYaFbmXAZB/as+Gcpy61NGKNxmQZzWDH9kXc+I=;
        b=mf75xuaL3zdqQ1VOmz4Kz9cHdVSuHckWWkRDU25Frub798H9FB1A9/lgjLjfjSQBWu
         Q90VBTMzMWSCwH1c3QxgUh5GCYU3ihcAT0VrbCjMrA31oODjj7LWJ7ZQ56fXqNdLJJL1
         TobCiG+xAQNgTOHNfMM7jwY2rrXktRnhEz5zKtWKAl5AFeCV/VG1kbNpH68jDk0zyjNQ
         6gGQN7g9ILaOmbyQymMosyb2g9qWyjAeuKGwwVPFH/BwZjS9XoitS4Ww8FOlY/m//Fk+
         23s1Iy9LSvLs+Oe0kh3SarLGhi2fiS1ncUatxx5TFurScM7ckuxl9lxWOiqg+cNq5MQ1
         qzLQ==
X-Forwarded-Encrypted: i=1; AJvYcCURs+8uwFg4mPXOhUTEUQ184gYpldNq9z7OR/9QW/PrsMYiATPRPB2lFxFOz//JstoBXX8IeolHUHI3jx0=@vger.kernel.org, AJvYcCXWkyjGIroGI9qiydSHLSK7A3NNGKvldqxPBqJIIPiEVzT1QUgHBUlPUPmJq5utxFO5AwIQMUDFLAkmtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ9Udl2xu8tPfoM+exU7Vn3w5k7oWV4W2xkrWv+En5ZtdQB//P
	aIg6UfpRwGlSYUhIIO4aOoeigjFsUoPeUFuo+jE8+weOVVmRxKZ9Jv7LnihJVTSV9ckTio2blq0
	MqWL+PjDAS8LHTs5LS18N5dWYjVM=
X-Gm-Gg: ASbGncukZL2k2bZfvhr8t6XSaYWNTg6KSiTQNVM64BywZ+6ExZjCHcinsXFC3PdkRzc
	hA+WRKzRotcga7OwJrm/uj3YzBSUTcjxa/MdCfpnJ0rVmuXK+DuaiPvLWS+mq3VSn5v5ZbZ00qs
	cVwpIPPBuwlkXq8CJwcpCJLPtA
X-Google-Smtp-Source: AGHT+IEQrgiOAdQNy2yBIyuqBwe9bX4LyjvCptdkUAZ9XPg9feuMNZ2nYBo0nMfB64Zz26Cd3qkdO1IcpskzU8aV5iY=
X-Received: by 2002:a05:6402:28b5:b0:5e0:e845:c825 with SMTP id
 4fb4d7f45d1cf-5e59f4b6e4cmr709556a12.10.1741168247563; Wed, 05 Mar 2025
 01:50:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305081848.4f3023e9@canb.auug.org.au>
In-Reply-To: <20250305081848.4f3023e9@canb.auug.org.au>
From: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Date: Wed, 5 Mar 2025 10:50:33 +0100
X-Gm-Features: AQ5f1JoClPScNT6yozSEtd1Y5XwnYOA7-Pf9FF4yMEPlWpX6E32QLHyeIW0cL0I
Message-ID: <CAFqprmzZ8ffg974PXLCCJs+Zwu3cCgX+Pzp+FPWVYnOXwCMDFw@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the hid tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Mar 2025 at 22:18, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commits
>
>   e2fa0bdf08a7 ("HID: pidff: Fix set_device_control()")
>   f98ecedbeca3 ("HID: pidff: Fix 90 degrees direction name North -> East")
>
> are missing a Signed-off-by from their authors.

Seems like I forgot to rebase with signoff after cleaning up commit
messages. Sorry for the mess...

What can I do to fix this now? Should I resend them with SOBs?

Thanks, Tomasz

