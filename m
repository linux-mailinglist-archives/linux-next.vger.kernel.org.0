Return-Path: <linux-next+bounces-1348-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6EA866969
	for <lists+linux-next@lfdr.de>; Mon, 26 Feb 2024 05:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87C9CB215CE
	for <lists+linux-next@lfdr.de>; Mon, 26 Feb 2024 04:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830121B7E5;
	Mon, 26 Feb 2024 04:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QElqefSi"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7E71B582
	for <linux-next@vger.kernel.org>; Mon, 26 Feb 2024 04:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708922152; cv=none; b=gFG8oKUfCQROqZwrd6inGL9GMcKrtOl71ozG1ZTL0FTvNnw843iGQJQeWjtDAIPOKKcCskRBpRB7XmDmYzIepzl6scE0L+Pdl58h10IePLS7TgOeq6M1zIiU01p+2OrymdBJt1q8SIMGrN2NkFxhYUlw5FKFRfWcBPNjXOC86f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708922152; c=relaxed/simple;
	bh=YgmsCyaDQM+hvz5LzibF8i2C/KUrIruop1g19F5sGMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pelOen+zP3AE2TjupckkzMPgCziRtXuB5ZGvjaDcaomtTzkqZ3tGZX2Fm4AXjneNzVJBg5/+Y+QZ6YcmboMNOVR/EVJV4EkslOuRYCEQKDUlcKdAzvpnoTrXc+j3XbkTlhVNVIgbG9khPeievp9vseGo3ekTR+/DgqtUrPKzjmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QElqefSi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708922149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mNInRIAHX11kPLkn5JDEzJWWJ44ZyYTteaCUwmZkHQI=;
	b=QElqefSiP6TXWElS+hZ2GlIQisG4v5KoENh6nBBFEyYyb+xhDJVI2j7ylJcjQEDv96/WjY
	2AO0zYs3PdZs/AOZwmoPzd+L8r9G+CtdsX6gH65emBkhxNza+7wqodL/doS/WuB8D2Pe+Z
	dFaNo8h1nMykd5lSnSwcfqMbsD6mQIc=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-p4yJXahfP0OWfZmpt69PZA-1; Sun, 25 Feb 2024 23:35:47 -0500
X-MC-Unique: p4yJXahfP0OWfZmpt69PZA-1
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-7d2def0e3ebso1441264241.1
        for <linux-next@vger.kernel.org>; Sun, 25 Feb 2024 20:35:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708922147; x=1709526947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNInRIAHX11kPLkn5JDEzJWWJ44ZyYTteaCUwmZkHQI=;
        b=bmPkP9OtKm6Ujtx0/SXS/PvbORq9AysGT9rZJbCvFYjHwfKuzFFZC1AGiDk2rfWSIQ
         C+epb5SAHstWlTl6E4RoKYL0YpoMd2jqdKugyCChQoY+GXXrKm+RLHAvuBaI4dz6Nd7q
         i9eFGgSlFFM958HrBSR/g/pCjZPF6pJXekzvjZD4slhV015I40cFI+wrrKikSCgoW/FS
         pi0UStG4LVfcgkjIdE+3vt4uU1kbAVUcKQ9TcKxaG2nr/Jo2S+bm1JPnO2/6uRfblmeV
         lBSkahqB57IQKG+A9iJ1LqFyH2HR+Bisq1Vny+SkAhu5Kngku8uN5WPhdQJIlpDD1grv
         oY9g==
X-Forwarded-Encrypted: i=1; AJvYcCX463drG3Gtl5nqeaLmhce2aIMgqFoTuAQHhszlkBAqpNyqH5QTu2HBBOrJTcnLioRjseux9SGXETvofnbF3I7eMpXGoXq7OQpjAg==
X-Gm-Message-State: AOJu0YzO0uu17reE716Er+UhBSrBpbnk036Jm2MGCF2oJnes8iZH4w6q
	PmWlx+qvSdHjedJbjhl9OJeFXQChgdXRCjKIm9VzJIAymKkSXrkXTLB/y4yBU81KjDO1I1rtSqe
	6X9D3AyUWGHct9ziz7CMSkURuQTzoDsm7lA0eFnnQykm846b07kfiS22ohEHq0940u3VIgC96my
	dJBc6AOZBQxMkQIV4LRjzZhBR2AIGUyRVupA==
X-Received: by 2002:a67:f5c4:0:b0:470:3aae:7bf9 with SMTP id t4-20020a67f5c4000000b004703aae7bf9mr3437957vso.31.1708922147037;
        Sun, 25 Feb 2024 20:35:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGho3E9PF3VSZkqZUi88dUdxZ4miVeUE/lQIMlnYEhwOZSRYWcYTp0vGoWF2GiQj2AsM5JjTu+NbkdJ5labwF8=
X-Received: by 2002:a67:f5c4:0:b0:470:3aae:7bf9 with SMTP id
 t4-20020a67f5c4000000b004703aae7bf9mr3437949vso.31.1708922146746; Sun, 25 Feb
 2024 20:35:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226135357.29ebadf0@canb.auug.org.au>
In-Reply-To: <20240226135357.29ebadf0@canb.auug.org.au>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 26 Feb 2024 01:35:35 -0300
Message-ID: <CAJ6HWG5LATEMRJqH1=NAEKZ29=KQNTYPj4rJFJqWH=WoTKuSvQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the workqueues tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 25, 2024 at 11:54=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the tip tree got a conflict in:
>
>   kernel/workqueue.c
>
> between commit:
>
>   aae17ebb53cd ("workqueue: Avoid using isolated cpus' timers on queue_de=
layed_work")
>
> from the workqueues tree and commit:
>
>   c0e8c5b59949 ("workqueue: Use global variant for add_timer()")
>
> from the tip tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc kernel/workqueue.c
> index 65a27be81452,78eaea2e5d72..000000000000
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@@ -2545,18 -1958,10 +2545,18 @@@ static void __queue_delayed_work(int c=
p
>         dwork->cpu =3D cpu;
>         timer->expires =3D jiffies + delay;
>
>  -      if (unlikely(cpu !=3D WORK_CPU_UNBOUND))
>  +      if (housekeeping_enabled(HK_TYPE_TIMER)) {
>  +              /* If the current cpu is a housekeeping cpu, use it. */
>  +              cpu =3D smp_processor_id();
>  +              if (!housekeeping_test_cpu(cpu, HK_TYPE_TIMER))
>  +                      cpu =3D housekeeping_any_cpu(HK_TYPE_TIMER);
>                 add_timer_on(timer, cpu);
>  -      else
>  -              add_timer_global(timer);
>  +      } else {
>  +              if (likely(cpu =3D=3D WORK_CPU_UNBOUND))
> -                       add_timer(timer);
> ++                      add_timer_global(timer);
>  +              else
>  +                      add_timer_on(timer, cpu);
>  +      }
>   }
>
>   /**

Fix looks perfect.

Thanks Stephen!
Leo


