Return-Path: <linux-next+bounces-4977-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 805CD9F3DA7
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 23:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16D221886874
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 22:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806611D88D0;
	Mon, 16 Dec 2024 22:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Hx1r7iH6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54391D5AC6
	for <linux-next@vger.kernel.org>; Mon, 16 Dec 2024 22:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734388609; cv=none; b=CupAqqvounTLFljbKHSN1gp8tpDwpwMMmw0LNbSl+9cC/z/7aeRcv3ZwyX2EDUY0UI8QjGnaviiIUxlb5wnwtozXTp0PFYMa6F8Vg/Nhnpz427FUrQSANKmJ2CtJ0U7F99Qkfjzy5lkj5SBHnD57ZMS/cI79w/J5jkVfBkKIroU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734388609; c=relaxed/simple;
	bh=inXzpADGtPHeGwpIoq82t7ervJbwbUJ1Ucksm7CAcpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KeS6n5LLfD7ZUaNp5wvpxEJaMbNQ3G0UZKeLLo2Hj71Lnoc9etBNfbaWtkLmkbeyg68bpnZK2GO0dJ+fZl21SjCe9APnW/84akRdzxrGvGIrsQxNVgLiV97O3O4OgJ8YLACjiXfbd5Q7hHWtOrGKYaYHqr33DRo3cl7weOCyWJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Hx1r7iH6; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e3a0d2d15adso3145675276.0
        for <linux-next@vger.kernel.org>; Mon, 16 Dec 2024 14:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1734388607; x=1734993407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6os943Of1tDvW4uLJhDpBJWnflWuQy9vb7Ql1c+OMI8=;
        b=Hx1r7iH6fuT9WUUT8NxqnvhN35feMGRgJFERW9leSKxzbgFT3U19bwRB3yeE7vF5FY
         8JPLeEn4ERUkmngOlQA+H2fWT/hgmeceuSl92+g3OGX/hVVy0Ybgf7XB/31T+mjl3qcn
         WtvJ0miFy6fCRuVI9ZSNqATTchW+b2M2BI33AAxPmR/SxYmeriDdGbLIJqKZyfXbf97x
         XMdOPtfaLtIRQF2i+w5G80Xp4gMnF3Lu7o4ltf3A22q8RfwOz4+0k4eGtJ/mQXZePy0r
         ZLbGu22l8o7h9rm9AJAsf5s3P2hzO8V13zb6fTjyAkwoUdES4RoqeKvC3zSMVgKAnXh0
         090A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734388607; x=1734993407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6os943Of1tDvW4uLJhDpBJWnflWuQy9vb7Ql1c+OMI8=;
        b=uKnv6n6gAokpgrjY9jUGuwHFoBSr5XJ/FJ1XcHeMKt+bZ+q9qZaaLrrzHf0nY9hnFs
         EUTg0vPuhQ85kJESCfaN8Y/sbnBQ3Z77D/zvFXRsGJv/dWisCwMEEVTL8zEMW+qUxPm1
         dStVI1KpmQETKD0wqykjSTDg4rdBRsKJ6xCx6FUhF1Ex32BwzOLSpX9nFmQ8Oh5TSDet
         sZOpnNQBk3t1j5cHmiDTTdNh1yX5YzprzDmnc6t5pN5rziEKEGoAX6otBqRvELdPxDaC
         f+3Grqy6L/3nC5y547+Dyq2D9FW5hkYdkWH8WCG1EUc4OWfuhJR/rkgpZdseJiursNva
         kKng==
X-Forwarded-Encrypted: i=1; AJvYcCU8dAhSNGqdfhyvv4953RPoTnYvqCZpa4WtLdiJ5bwgaYr7ZkeOvV16M++FtWeObk1OJK/mjdwI/xjJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyrnUsiPPoHGuFl6sAt4c6k/0jO6PWGYJvWYO3pyxJRPmukI+mF
	3oa0W5wWzI+HhqGuhmE1Bp6HdpvCruRYWHoalKWcRATb3mj2QFZuND2BnwdkDks5yM4WSa6eVLk
	vai0wVeYo4lpjZ7XHM+U55fgGN27yWu0nbmqaJs/0bsnjGHA=
X-Gm-Gg: ASbGncvSGw66AQgpAYDqzquYqWHVrBSubIh7k6YMYrGBcyXDHiTqup9IszQmbsH5cqu
	ofaTfPlWygiILU7smykPcYocgbiRFh6mydNLD
X-Google-Smtp-Source: AGHT+IGVriorONirNEnIESXzmcduoTaMMyac5ha0vL5v2Xs4ij2bd9mHXsOFZQyFChVYPtOE00F/28qDUhdAj1sz3WE=
X-Received: by 2002:a05:6902:2785:b0:e39:8882:9ca with SMTP id
 3f1490d57ef6-e434a354f87mr12874245276.13.1734388606735; Mon, 16 Dec 2024
 14:36:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216174959.723936b0@canb.auug.org.au>
In-Reply-To: <20241216174959.723936b0@canb.auug.org.au>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 16 Dec 2024 17:36:36 -0500
Message-ID: <CAHC9VhRHMd2VUeDj0+cVLa=jyQdOsATVgiAYYEYbhmJ7-EL=iA@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the security tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 1:50=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Commit
>
>   8cd7488492ef ("binder: initialize lsm_context structure")
>
> is missing a Signed-off-by from its committer.

Fixed, thanks Stephen.

--=20
paul-moore.com

