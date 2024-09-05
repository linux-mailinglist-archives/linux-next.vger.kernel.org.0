Return-Path: <linux-next+bounces-3607-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CDD96CEE1
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 08:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A832287617
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 06:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2868E155C9E;
	Thu,  5 Sep 2024 06:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vZbPEiFf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9955A142E7C
	for <linux-next@vger.kernel.org>; Thu,  5 Sep 2024 06:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725516432; cv=none; b=EUL00gJq0y1UtxlLbgt5gqAXypgDYg5jufdWz4siRuKal0sc84zTFpQPcRok0bNRSQvfG4tUNIX6HohrZwSkvJ+rjcz5HeAkQPdy2Ps0ha/iEoXT8g2F/sD1YCMuPPFQKO8GYKZEKXWoRw0zfxYnWq2Iu5dxaH7zLLeHHSab8vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725516432; c=relaxed/simple;
	bh=NxGLPmejrw74DcimUGcFe4YLeXDB7spXSH5h5gKxSsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbFp2qawG9XgX+SMbci20L3Fym2rsjtGTtphbA+aaH+9KX8zqzHeV8+XbtqxEvnJ2q9TRiDxYcuPNua8gzuw7kET62E7OmfhITydYZ1NanvCQ73p40HTencpEkv674v4dtq2aUdmjkdnR48oPgZyek54I4fUmbz/af2ZnCDkGBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vZbPEiFf; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e1a8ae00f5eso537986276.0
        for <linux-next@vger.kernel.org>; Wed, 04 Sep 2024 23:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725516429; x=1726121229; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IsjtgqmTVZY/Avx+iwqJmjfLRr60MNvla09DOjSeazo=;
        b=vZbPEiFfqDdq44V3zwhpz0bQmuSuHZmIGtpDbJH6wVRb1hUvBL3Rh+818l301hwOSh
         a90TJF60tSythWTjN8zqTAauayKNfYmo6HTkQZTvPoSQDxm1c6KARlNQgy/T/wqruxTT
         rijfI1ztgZ0fwtOQmCpvhQ8lE3RjQU9mzNYIEY/rQDJy9ZfNE/scq/a67gs1BsdsvXOm
         30bm6qb7gcKmb6KpM4xdmQgG+oENgoWDcK7LuJiRNZ5NHdeXCb9YLdFZhctwVqZpKAav
         Dvz0fvdreSymOXOQvO1ieHgbY3YL1TtUEOcQvrIMq5IMycJ7pBjcWr/4YofB2r6QJRd9
         +piA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725516429; x=1726121229;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IsjtgqmTVZY/Avx+iwqJmjfLRr60MNvla09DOjSeazo=;
        b=DCE8JYz+CLtNGRWoGCHDq6SN3WQXeaEBvULsgFkc6lMShWXvJXRuzpmI/gpiFMpHU9
         wVAA1o1ZVmu6FNKdyshnC+faftF6KinKsnY3/KG4YqmlcXLCUrkjI45ta+Es2iRq7Ggq
         KFcS/xtA3mAttCSUD+xs4FKuKvGmQ2V5lKwTccgOPh8JRhm++0oMQgnj1+o8oAoSb54T
         8V6b9ADaTuhBHiHfKkCva3J5FscH9tPRmH2eMIZHXkLs5PEBw8Bper7w9X+uiXYC1HAT
         KUEb5RKf/TknqKQKiacG/2ao+dV1FOpfD6hewwbLvXRCMQ3C/MUEWKPkvlJdcSXBsFGp
         VUow==
X-Forwarded-Encrypted: i=1; AJvYcCX1vw/hUNA/Un8PcvUu1SV7VbUau6Z+4FvUQdo4FkhrozjlO0t1n4sop9nPk+hpjr4MS9VJLAxcD1TF@vger.kernel.org
X-Gm-Message-State: AOJu0YwmnZMXA1RFBBPIGDnmHaTxr0Icx/yPej3Y2KQp3G3k0WUfOcKI
	g32R6LtOR7DU3ZruE7OH/iVTUVs0RSeZW3Lm2jaXcr2SLsCm//CnRh9KqsbnUc1uAEXh1Zqx699
	gJEN9yxGqKw/ejbUKnfEnYPGh8GxTqN//b2OD
X-Google-Smtp-Source: AGHT+IFtujPA0bTF9fDiOxELAuwSwYS03wMEVuvJ9gcgDHzHNjL7n+UBsEChTzv19jvjY+9cvJh4fMeDMCD23S+GQ7E=
X-Received: by 2002:a05:6902:724:b0:e1a:8ceb:49bb with SMTP id
 3f1490d57ef6-e1d1ec85b75mr2381787276.44.1725516429243; Wed, 04 Sep 2024
 23:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827160631.67e121ed@canb.auug.org.au> <0a197b29-f0f4-429e-82c0-f54469f31b12@linuxfoundation.org>
In-Reply-To: <0a197b29-f0f4-429e-82c0-f54469f31b12@linuxfoundation.org>
From: David Gow <davidgow@google.com>
Date: Thu, 5 Sep 2024 14:06:56 +0800
Message-ID: <CABVgOSndJLkmeDDXhSSdGt3vaJ+_2p+RRhAK9gH8TP_zv9=gyQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the kunit-fixes tree
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Brendan Higgins <brendanhiggins@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

Sorry for the delay: I've been away.

Fix should be here:
https://lore.kernel.org/linux-kselftest/20240905024757.3600609-1-davidgow@google.com/T/#u

Thanks,
-- David

On Tue, 27 Aug 2024 at 21:39, Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 8/27/24 00:06, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the kunit-fixes tree, today's linux-next build (htmldocs)
> > produced this warning:
> >
> > include/kunit/test.h:492: warning: Function parameter or struct member 'test' not described in 'kunit_kfree_const'
> >
> > Introduced by commit
> >
> >    f2c6dbd22017 ("kunit: Device wrappers should also manage driver name")
> >
>
> Thank you Stephen.
>
> David,
>
> Can you send me fix for this on linux-kselftest kunit-fixes branch?
>
> thanks,
> -- Shuah

