Return-Path: <linux-next+bounces-7976-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3DCB29F2F
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 12:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42B3F4E2030
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 10:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2FF2765C1;
	Mon, 18 Aug 2025 10:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Dly7KguO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079902C2372
	for <linux-next@vger.kernel.org>; Mon, 18 Aug 2025 10:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755513182; cv=none; b=DtczJ2mbspsy9FkAkxMScS5QNnx3t6WbBb0XWcKjTdcVZLClFi9pM7p7UkzqK/LVLTsWyPFlniYRSpXSD8+RrWV308zEc5NO5uHtGTx/47Xo72+rNCcEZnEBCyNhoU4oPHx9/S6xoXnRVxP1rtfmJV7dnSiXqXIyKtzL5dp2rBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755513182; c=relaxed/simple;
	bh=jGu0g8N9DbdvHLEkr3IQmTQcjJz2j/XCthQ+fUUAMmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eq2aM5gsCJUT18T/DieFvFoMvRBm7vGRrC3DzXBe3appSe1h6reWzhUy8zIDiuaFAuGytUyM2ZtvpLlbqlngjrk3TsUXv6zn4gMBMhfAlaScoXDi/Om8d7GmvAEJpahQo8QpkQ219KZiLd4/VtURWkxKLJ/eQFZwxzFe7PdFyXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Dly7KguO; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7a3a085so617927566b.2
        for <linux-next@vger.kernel.org>; Mon, 18 Aug 2025 03:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755513178; x=1756117978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YFAb2peAQnBRSpCYeUdIv2YpqMbX/LsoLgoW5Q0xsQo=;
        b=Dly7KguOS/LeD9Ro0Ply8C9jL1Oxp/WqGvsqlhMlhaQwn1RFZkuBR4+uoex1EAiTjx
         MRzI+96tr1lH0BOXJqcNgp2bo9KO30eVqIjVqwjioV1YwpxQKOp3VZhrHugE6P11Zfbq
         Y1r9MkvCQZTv5RteCcsKe7HWnsbTLOtaqQ7h5kWsONLPoo7GLnZPhdXC8QKhfQSAUo0C
         k4suBJmuWQWF9FiaNuCTf0G11rQebOXokeK56rnlq/xjpd0ALXzFMt2EjpT864bB68jD
         ZgtXKigI4/nfHLN5Ize5pnBuybBwqhpML8JZhuEaVp1TQ24cb0r/QW/FMAaFvXaZzLKS
         cNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755513178; x=1756117978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFAb2peAQnBRSpCYeUdIv2YpqMbX/LsoLgoW5Q0xsQo=;
        b=S5s+COTnkXS8esyNaiCtcV1rIqe0q2QHDO5t9ZxWbdA4Uktj0jiaLQD0ONYhsShbMD
         oKCPAxlMUvO1c5ewcS9k6oaIXVhPah7zjLyv0FONZ9RXEmE19US907/wUK2uSHhSLZRB
         461Js50aBc+5GeQIt0wO5NjwMCy7lfNqodTS9+NJXG5dCSbH+6Uxh1/ZuuLrJYXdNTjh
         w9+yPos04tCrII2Wkt2su5KK79yWpo30JNaBFl4TckvwsLI4b73EtiqiqLoV0EGizIgC
         704wqadxNBVKVA/JLZzHFWYTHPKeb+WHK02wymBU55vYnvFJ+CDcGnld2aOYnhpzenF3
         wYvg==
X-Forwarded-Encrypted: i=1; AJvYcCVZFJnqGaSin+wkJHO5GanmyDl78VTMYdMayZWgiZkolPtNNQJkMoEsN0LYlc0oF5uRQbr4PcXd2vr/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+E3dme9isX0cyAUlIpe1UtvEDXY91gTVQnusMOpwRYuiG1aTw
	ab7wzhf8OM3vv1rDIJxDSjwJduWHTwqNaIq3ph6ArNxcA2hml6/0PwsSrS9X8EYJlFE=
X-Gm-Gg: ASbGncsrozps9eu442o1dMMwQCSROijYUKsHyEW3LKWLt+e0f55GJheTMPWad3ZIw5f
	/L44p2buI7aI2qD4RlUSB6DEqmBwwJkunP69YJLyT0bHhp6jq/3hSas1SXaIcPC5JVOT0ie2Dey
	UfYbqQ+dCWLLnHBRrN/K59QTTIps/DePP6ZGBXXeYiX6OVcljJZkHu0YW8pBlMQnvvBAPyyDJHw
	Z+PR2d941s/FJTZzg699nc42iRbK1pKs0iSwHxVBELDL2uRuaXXxGedvo/LWyuSUGtKacwEwfsD
	hO+cjC+6cvpjVlpWaOD6+GTnO1nhAgms2Mt+UcR7C84GC3ZZvbWXvebVSsCkJpCRdGG14zNrSDO
	oXBMdG2hP6csV276Jj/e20HsSZ6AXU3d5dfAe
X-Google-Smtp-Source: AGHT+IEHoyUEzJLivgsaxPJyaX0pojnZJD9gDn1yL9lMrMY1Om4L937p6B4a4FV7zN+yEwekT9sCZw==
X-Received: by 2002:a17:907:78d:b0:af9:3d0a:f390 with SMTP id a640c23a62f3a-afcdc3310admr1124112866b.43.1755513177186;
        Mon, 18 Aug 2025 03:32:57 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53f49sm774967766b.7.2025.08.18.03.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 03:32:56 -0700 (PDT)
Date: Mon, 18 Aug 2025 12:32:55 +0200
From: Petr Mladek <pmladek@suse.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jikos@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: please clean up the livepatching tree
Message-ID: <aKMBV6LfqCYw1wQm@pathway.suse.cz>
References: <20250818121456.378af88b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818121456.378af88b@canb.auug.org.au>

Hi Stephen,

On Mon 2025-08-18 12:14:56, Stephen Rothwell wrote:
> Hi all,
> 
> The livepatching tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching
> branch for-next) only contains 70 merge commits and appears to not have
> been updated since March.

Just to be sure. What is exactly the problem, the merge commits or
that it has not been updated since March, please?

I have just removed the merge commits.

And there have not been any changes ready for the livepatching core code
recently.

Best Regards,
Petr

