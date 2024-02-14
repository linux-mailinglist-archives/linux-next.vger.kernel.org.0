Return-Path: <linux-next+bounces-1152-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C458540A2
	for <lists+linux-next@lfdr.de>; Wed, 14 Feb 2024 01:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4621E1F2320D
	for <lists+linux-next@lfdr.de>; Wed, 14 Feb 2024 00:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C0A947A;
	Wed, 14 Feb 2024 00:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="djCBOE2y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6D86127
	for <linux-next@vger.kernel.org>; Wed, 14 Feb 2024 00:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707869020; cv=none; b=uPF8cwDw+51JE7sAl8Pi6fKr/Yk8T2w3nSZ6u6oUbjam4aNroKGoH/lRtSQgv4SOrbnaYeJf+p1+jrT9CQqHLhKhn3a5iVEXJ2ZdYeVP0LoZHrh9K0+//BmCA0NpWLJ311y762AXgwqQbYqEmguCM8wK3ispsYmpKxmKmXDkojM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707869020; c=relaxed/simple;
	bh=8hhjJArGuTrb01w9KR7VfGFjTK+QM8XbPfc5O1BlDNQ=;
	h=From:Date:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GD+WyrznRIEYUmtTuR5csX9kCvvFfoY/B7vh41w8wv2oPcnimj/VL03qynl3YkoI1CIKWzrgIn9R7cnTWRayLDRzLk3YOa3nS3VgscKQU13yPuu73tWQpdEujSsZtVkQUqFo+r1QNChISO26tqKLm/ip0ixkFUOA2cjJGmZ0shc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=djCBOE2y; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d51ba18e1bso48192135ad.0
        for <linux-next@vger.kernel.org>; Tue, 13 Feb 2024 16:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707869018; x=1708473818; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S5KvIIxgHED0qUD38JtNJLqQBOi5mdYPuXDuUCUlxsI=;
        b=djCBOE2yZfChkl4BK4rM9eukCOAbfAMTqZoHl8Ee2TTxj/2lv8BiQZtqIpkaEygHqS
         fuodi6w+OO4qRosBH/JiHz4fAmiLc02TEsldoR7cJwZMTne7sjWrpbFd4ELFLeQH4yh9
         aAlI/ZU+3DtVMnNc0HGkr+FcY0xLCHNmdbfmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707869018; x=1708473818;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S5KvIIxgHED0qUD38JtNJLqQBOi5mdYPuXDuUCUlxsI=;
        b=NatkZFmZJ+qLiWcvRhNydpSkEpaEfo/ClPbB0fCk6p8/ztwQNbs/VnhoobF93oCQJ7
         14EjFloR0L2nUdfAdvjmHREKPEJinHh52w9cAiQtaGYx8fK2rw6zvhyckDrmR+gX8iAA
         xXowWDwqvi2hNWfq+7dXJKq25hQvmA+PkY1Tzv6AaQkHkDrU6NEtwouidAu2srdtd1s2
         M9L+ruwG5QRR8jmyug27gkiCWbXhGMiGdV/sM6MXcrF5nR29YRLCle+YktxSbba63YlK
         76zhaHHgmmIOyvZ7UZSuPg+Q/LOOwIIfqGpuz1JmuQRihEVV5D1Gg8yJepSGQ2Uu/DGe
         z+Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUimqXJNSm06hfZjAPgGnDSHPmm2l0jdL98Xt2n6fTWUHhYcnwwtwU86if7bVRhdCtxZeTSRNoxUclz2JD7vcF3NzZC3wozeyyBvg==
X-Gm-Message-State: AOJu0YynfMZD1NnugmxJPOHmok2vsj6ggVt3vkzHzE6wWGvMIA2ClRPA
	tfK00H3i4dRa2ERlXPs924/P17uiwR29spFsC2fgf7HsR1ur+gh4o/GiZn+Olw==
X-Google-Smtp-Source: AGHT+IGvii1pz5Qtbml0HlPO4mlvNOppuYUgtORJaUe6oE/++e0grTswYB62DSIZ5RJkmOTD6odEsg==
X-Received: by 2002:a17:903:2289:b0:1db:4c8d:9135 with SMTP id b9-20020a170903228900b001db4c8d9135mr1097758plh.8.1707869018377;
        Tue, 13 Feb 2024 16:03:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGNfPy6SBtkiwYFx7mxAkHk5NefCYdhE0oFJsirFxOlvy154DJNYLhH8iNKcCbgDLM8tQwSpkD4vDYiOTVn6kKmS9xgT9f2tGxoZr3nZDpeKGifhQ+wfiE/R3kDoMripDcGmBiOFr9HHNwjeTUpKLjOtfzV9mwPjJ1UAfpf/QajoJehd80y7lIIu2p4W3w7KbpbI1iw/wrtu6YYXbEpxPBJhsZfW8Eta/S49d+dvSHaWx1OEGHkju4c+nFG7cJnZ6j6zuuEG3ZEOmoJygJ8yiUCA8aV5NLcjiY3QmvnxKkRJv07FH0weKDu0CTyjmJfAYyuLN7fj3Q70x/tQaJCAsgFZYR6DzjRA==
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id kd12-20020a17090313cc00b001d706e373a9sm178448plb.292.2024.02.13.16.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 16:03:38 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Tue, 13 Feb 2024 16:03:37 -0800
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Darrick J. Wong" <djwong@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brian Foster <bfoster@redhat.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: darray_vprintf(): API usage errors
Message-ID: <202402131603.E953E2CF@keescook>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20240213 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Mon Feb 12 13:55:16 2024 -0500
    ead021e0fe5b ("thread_with_file: Lift from bcachefs")

Coverity reported the following:

*** CID 1583634:  API usage errors  (VARARGS)
lib/thread_with_file.c:123 in darray_vprintf()
117     		va_copy(args2, args);
118
119     		len = vsnprintf(out->data + out->nr, darray_room(*out), fmt, args2);
120     	} while (len + 1 > darray_room(*out) && !darray_make_room_gfp(out, len + 1, gfp));
121
122     	out->nr += min(len, darray_room(*out));
vvv     CID 1583634:  API usage errors  (VARARGS)
vvv     "va_end" was not called for "args2".
123     }
124
125     void stdio_redirect_vprintf(struct stdio_redirect *stdio, bool nonblocking,
126     			    const char *fmt, va_list args)
127     {
128     	struct stdio_buf *buf = &stdio->output;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1583634 ("API usage errors")
Fixes: ead021e0fe5b ("thread_with_file: Lift from bcachefs")

Thanks for your attention!

-- 
Coverity-bot

