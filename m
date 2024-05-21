Return-Path: <linux-next+bounces-2369-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 521DA8CAC6C
	for <lists+linux-next@lfdr.de>; Tue, 21 May 2024 12:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F57B2823C5
	for <lists+linux-next@lfdr.de>; Tue, 21 May 2024 10:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFE96CDC2;
	Tue, 21 May 2024 10:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="J4aF987Q"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F28F6CDBD;
	Tue, 21 May 2024 10:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716288275; cv=none; b=XVBVNFJVTgQJ93V8Ht+9QUZl7rWtwZ8HkWJMNmjDmsRo3++JCfdP7vO8GQSiQGmMAS78eqmCdAgJ266A7mgnT0w7LCPcV44tqH9Xqw0aDlU5xkp2Z3UtXH7uZHx2hcU8ZjCEA0OfpfmjRzMr1dXL6CtwXHv3ubj7WGyivwZXCBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716288275; c=relaxed/simple;
	bh=1Iwp34WIXn/TPRJOcu6SUvQdBFGuAro05DI9cIwDPXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6nRJy9nzrCyOHlKpXZTJcJ5A9guO8XWP8K6/ErKgO5Mnk44VKr9p/MF6NXh9+kClfBr02XwujCxGkTo5/KwaFNoAvvFb5fmDUwDWiBX3gHcJJVVzfVDuJvFTh1jGebPbHM1Wtu5FaPBl4QSTC4pUrAezY7tt8ZYy6Ww1PeN5AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=J4aF987Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83113C32786;
	Tue, 21 May 2024 10:44:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="J4aF987Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1716288272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Iwp34WIXn/TPRJOcu6SUvQdBFGuAro05DI9cIwDPXU=;
	b=J4aF987Qam6/RcaSa8geQ0riPAiASfLxSPyKMskFnO7K2xjw7XjwqUUCaLyFHnfmm56brw
	P8w4VRoi9fHSq+twd9rk2ZYXfkYP5L7qEU51++JT6azxfvsdTRsezx41F8VKXZNkRv543Z
	wG259ADQXU+OfLryjBPjxQ9Oiv9Ls5o=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4028e81a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 21 May 2024 10:44:32 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-de61424f478so3431087276.0;
        Tue, 21 May 2024 03:44:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPSbl2/CqGGIqipNgu2kBUjdnruR/izm52C71kLPaW4K0t4D2bwppJi78l9tGXUGRpEt/n6vZFST5Wkg8edX5nyZaNyeVNxUvS24PN/HNW791y2aKoyhLjGmwgKp/RLB+IkSql1nleog==
X-Gm-Message-State: AOJu0YzPNLYC4m/+LVhh50DiW5gTEF1KEwZzvfOsORENcwVWWUXEM1Wm
	4CyLMQXygUnkbudJrEdPDH/wWHWu1tQzQeG4LhffG6z2j2y7TU77+55O7JYX2NPKgbFYHR0wnjo
	i8Vf5FvSfBRL5+sVriJ1KkPFtLAE=
X-Google-Smtp-Source: AGHT+IF8zwlnybijOkvhDCfOyHo2mee4oB4zfqOzvIszNc7Suqr0jgwx6kN29yeMjE1zT3WHjMv614UuLe5PUrHldrI=
X-Received: by 2002:a05:6902:28b:b0:de0:f74b:25f3 with SMTP id
 3f1490d57ef6-dee4f3961dcmr28524605276.60.1716288271210; Tue, 21 May 2024
 03:44:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429161743.21019d15@canb.auug.org.au>
In-Reply-To: <20240429161743.21019d15@canb.auug.org.au>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 21 May 2024 12:44:19 +0200
X-Gmail-Original-Message-ID: <CAHmME9pdBbO0B17WgLYNyGpoK6UsaDPXGo7pxTakJcWfN7HTgg@mail.gmail.com>
Message-ID: <CAHmME9pdBbO0B17WgLYNyGpoK6UsaDPXGo7pxTakJcWfN7HTgg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the random tree with the pm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Theodore Ts'o" <tytso@mit.edu>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Sudan Landge <sudanl@amazon.com>
Content-Type: text/plain; charset="UTF-8"

Fixed.

