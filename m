Return-Path: <linux-next+bounces-4473-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B927A9B29C9
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 09:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EB2F1F23397
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 08:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D1D16FF45;
	Mon, 28 Oct 2024 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFFAuGVt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12AF18A6BC
	for <linux-next@vger.kernel.org>; Mon, 28 Oct 2024 08:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730102529; cv=none; b=bl5g/+MtcO7MnIrS94jYa+gZ8NNgkmlRq1/aTslmXqiFAJ8w8y9Y9dkedGiqJevqmeTzwHrXQ6OdgopBjAs6nrlT15tJakyHF7LP2SVNxl838mdwgscyLz8tNO7H2ggC9JUKCYiFFyxs2YpU7o/y0cpSHXh3gsuUfXVsMV3YE3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730102529; c=relaxed/simple;
	bh=p9/S3gpqBBFvIF9mqT6Rd/e3myKZ/8lD8rZRfZ+6AKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mj6+J4dlEGAU7F6Au1TRvcCs5OSeHBLyXG2b5pDsS6wY9daU/65nh4UGdeXXBaXbpYpPKy4+EUMEM1a2o79M9Pk8qTiyYipa99rI/AfSxA4JEAaKYS4VlH1Rvk0Pya3kbfbVPxYHV2SzLsUJ0Oy3SccYK3MCNdpim2xrj2EsO3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFFAuGVt; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb587d0436so39141191fa.2
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2024 01:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730102526; x=1730707326; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DAqDGxZpCGVRYKCi2UKLQtM/wwEY6Bui2ZFR9TaWvk=;
        b=DFFAuGVtoY0JQIKvbVWQACsfIC15C3Ba+qpogvJ+6Dgcmw5Zy6PUj1vVHVOC8XD/Gu
         q7s2l3XPbkZ1XY9h2AXZbAEUV/vrD1rRmQJPiEgMu+o/YDrasmaMRQV0OMSUz/1S37ND
         0ea7hUssoeO63BMRbFWv1hCs3JRHkaPFpFEmlquY40Gjsyh0qmZWKcXfpXrUF2reKYmx
         YJsSyS6D+Oz+HNgE+h8Jjt4ppVAYb11AYiW1jlgZNhPXU+aiyZaB0fUMgRXKRNgm9CEY
         J3LX26fqLWR18GjcLtY2C3gvxJAvTdVQxRFALbEaqLE5ldGnqLwqicXhcjnf2mOqft/A
         HQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730102526; x=1730707326;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DAqDGxZpCGVRYKCi2UKLQtM/wwEY6Bui2ZFR9TaWvk=;
        b=eGr0Kxq0h/+193jiiAVH1V0ehqW5/ETJDul1Ge6A1f3hiRetMURxmkq/hFmEolFyu+
         sw2d6dbYxjLFSIw+njsaCpMbNlVDODt2pBVjfLSX7BXucnYvKXA/iB3nm2Yi6MfmgpLm
         jWBjgG9u639eHgB5AqNZNO+FZ+6iJmCu5UaWQTvcps8d8yNxFxE0Iv8WHDo7OptCk18z
         tHQ4mCviUKBGeDu9uu3D7cA/ytnk3JArNWyhlBep8Dw06HZc1WyvG62tJ3hnpSfPrBSM
         5l0qCP7r9T46qeZ+awqK4DYghE4DvEcR3+uJXe5lMveyQw5kz5egST549T/33NCgbXOZ
         jnmg==
X-Forwarded-Encrypted: i=1; AJvYcCWxYxFsKrFbc5XhSN9Ji8Fjt6v/+tQsSPnM/Vu3FYDtJnjIqcB3p+OlvCFmRpGSD6Z54aeGabQyb3to@vger.kernel.org
X-Gm-Message-State: AOJu0YzE24g3nXJDqBOnocp3ld8uykW3+LiHyzt8GoPTumXdVh3ygVtN
	LOQGM2gDHRYyervnNReU/S25bT2xqZEFM/+Kn/pFzjlqVvgHtSEr
X-Google-Smtp-Source: AGHT+IFIXnjDDj5iAGaKQ+Q39+yibCsxzV8DNEB+xRtQY2yw7NI6Bb7ME+PjavOhFYqweVJRHPGd9Q==
X-Received: by 2002:a05:651c:1a0c:b0:2fa:d67a:ada7 with SMTP id 38308e7fff4ca-2fcc940c781mr10748681fa.23.1730102525572;
        Mon, 28 Oct 2024 01:02:05 -0700 (PDT)
Received: from grain.localdomain ([5.18.251.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4507b9csm10842641fa.28.2024.10.28.01.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:02:05 -0700 (PDT)
Received: by grain.localdomain (Postfix, from userid 1000)
	id 3F9495A004B; Mon, 28 Oct 2024 11:02:04 +0300 (MSK)
Date: Mon, 28 Oct 2024 11:02:04 +0300
From: Cyrill Gorcunov <gorcunov@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brahmajit Das <brahmajit.xyz@gmail.com>, david@redhat.com,
	linux-next@vger.kernel.org, sfr@canb.auug.org.au
Subject: Re: [PATCH v3 1/1] fs/proc: Fix build with GCC 15 due to
 -Werror=unterminated-string-initialization
Message-ID: <Zx9E_NI89XSE3H-f@grain>
References: <20241004145804.57278eac01c2601abb20c671@linux-foundation.org>
 <20241005063700.2241027-1-brahmajit.xyz@gmail.com>
 <20241007190813.f4effd5788cf7362a4fda19f@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007190813.f4effd5788cf7362a4fda19f@linux-foundation.org>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Mon, Oct 07, 2024 at 07:08:13PM -0700, Andrew Morton wrote:
...
> 
> > Cc: david@redhat.com, gorcunov@openvz.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au
> 
> It is strange to cc only linux-next.  It isn't really a development
> mailing list.  Please include an appropriate development list and/or
> linux-kernel on patches.

Thanks for handling this, Andrew! And sorry for the very late reply :-( I managed to miss
this email somehow, still patch looks ok, thanks!

	Cyrill

