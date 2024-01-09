Return-Path: <linux-next+bounces-697-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8AA8289B6
	for <lists+linux-next@lfdr.de>; Tue,  9 Jan 2024 17:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F29411C21437
	for <lists+linux-next@lfdr.de>; Tue,  9 Jan 2024 16:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D96A3A1A6;
	Tue,  9 Jan 2024 16:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7zvp7nY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC743A1A0
	for <linux-next@vger.kernel.org>; Tue,  9 Jan 2024 16:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33674f60184so3168527f8f.1
        for <linux-next@vger.kernel.org>; Tue, 09 Jan 2024 08:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704816486; x=1705421286; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jjxiE4RN/pGMzfyi7o7airmhzjWZK0FgpxYzjcRDcB0=;
        b=W7zvp7nYjY1qvrVzcyV62gX1n0X3Q8T1bt2iJXrT/mrQtu7pazE6AIns2voJjCKpso
         EldZx8Z06Mwz4Tpc85lWytrROPbgk6WH/aKLuc2oSCUcNZPDIWYry4tnsJ8AfBj+d67s
         nqhLJW5V8JfZJHe8aimmrReofNJfgrX8ixBMV1QQAA0exNnsvp3DSz6TOJcv3MxQv/5F
         PXDkl7mTF+OkxPNo9CJ7JfwDBvCaEZj1ayNGgBEurS5lelKKZp0C2CzKF+Fbbz1ZJatj
         CCQ9M0G9T5Gg2OrDmEeBarTR5XUKoNrxXkjnh9Pxw/7Me7sRoXb9A86PJhmmcE2kOzec
         ZwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704816486; x=1705421286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjxiE4RN/pGMzfyi7o7airmhzjWZK0FgpxYzjcRDcB0=;
        b=s//Fh1WCFn1FmF0+Ez2IDFiThWDTflaPepVBMqzyghsS4hVqlo8xnG78OjON5x5Tbp
         N18OCaZbpNsexSCtls2wKzkSUGPJYA5DLV3KhYfhN7qqfIjrL8WDtjq1iFnj5sqpv+fH
         BvfHjphwnNKNs6t0Tvgs3qwquOA8Xh319tVLIE5byl9Wsclhb618onxll63HgbHj1TBo
         R7RZVD/NdXW9b6pvo+/hOfwzeFUT+6JKx51gHLck4swoJe61vIC90TYt9FMDxZCFXVhN
         /mxc4wD4tK3Ss7vr47RrJQGRfIB4juSZJMa71wdkkGVENT2erq8vCP/HARQZG26qKNG0
         guTA==
X-Gm-Message-State: AOJu0YzCQCdMZdu65a8XW5MK5z8hbHzHDNVBFALDPI67Lj584uExcStw
	Ngi0U7nvZ0Z8O9/ukskaEKjwcMo/KFg5mayMmA0vY+Rb
X-Google-Smtp-Source: AGHT+IHyhtCKJy4QqHgZfWcrO4wxEn1G9I6ZZW9XJ2Tn6dbAMG5BDC0dd610IUJR+a5YVO42d5aWTktiVEba+aupcZI=
X-Received: by 2002:adf:ea82:0:b0:332:eaa7:56b0 with SMTP id
 s2-20020adfea82000000b00332eaa756b0mr661226wrm.14.1704816485763; Tue, 09 Jan
 2024 08:08:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5cc0f83c-e1d6-45c5-be89-9b86746fe731@paulmck-laptop> <20240109155127.54gsm6r67brdev4l@revolver>
In-Reply-To: <20240109155127.54gsm6r67brdev4l@revolver>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 9 Jan 2024 17:07:54 +0100
Message-ID: <CA+fCnZewUEv2BMX-D=a+5wosusM-H3tOBpeJe6oyu51mMLXQnA@mail.gmail.com>
Subject: Re: [BUG] KASAN "INFO: trying to register non-static key"
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: multipart/mixed; boundary="0000000000000aab15060e8585db"

--0000000000000aab15060e8585db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 4:51=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
>
> * Paul E. McKenney <paulmck@kernel.org> [240109 09:04]:
> > Hello!
> >
> > I get the splat shown below when running rcutorture on next-20240108
> > (and some less-recent -next versions) on scenarios that run KASAN and
> > that also enable CONFIG_DEBUG_LOCK_ALLOC=3Dy.  I am running gcc 8.5.0.
> >
> > Bisection fingers this commit:
> >
> > a414d4286f34 ("kasan: handle concurrent kasan_record_aux_stack calls")
> >
> > This commit does not appear to be trying to change the annotation
> > required of KASAN users, so I suspect that the commit is at fault.  I a=
m
> > including Liam in case Maple Tree is the bad guy, and should call_rcu()
> > need adjustment, here I am.  ;-)
> >
> > Thoughts?
>
>
> I think this is ma_free_rcu() registering mt_free_rcu() in
> lib/maple_tree.c.
>
> The commit you point to saves and restores the irq state in
> __kasan_record_aux_stack(), but the trace below shows it is called prior
> to irqs being initialized.  This isn't what lockdep is yelling about, so
> what am I missing?  Maybe it will be caught after this issue is
> resolved?

Hm, I see a discrepancy in the KASAN code related to the guilty
commit. I believed it to be harmless, but perhaps it is not.

Paul, could you check if the attached patch fixes the issue for you?
This is rather a quick fix than a proper one, but let's see if this
one works.

Thanks!

--0000000000000aab15060e8585db
Content-Type: text/x-patch; charset="US-ASCII"; name="kasan_record_aux_stack-fix.patch"
Content-Disposition: attachment; filename="kasan_record_aux_stack-fix.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lr6jioa60>
X-Attachment-Id: f_lr6jioa60

ZGlmZiAtLWdpdCBhL21tL2thc2FuL2NvbW1vbi5jIGIvbW0va2FzYW4vY29tbW9uLmMKaW5kZXgg
MjIzYWY1M2Q0MzM4Li4wMTQzYzFiODIwMDQgMTAwNjQ0Ci0tLSBhL21tL2thc2FuL2NvbW1vbi5j
CisrKyBiL21tL2thc2FuL2NvbW1vbi5jCkBAIC0yMDgsMTAgKzIwOCw2IEBAIHN0YXRpYyBpbmxp
bmUgdTggYXNzaWduX3RhZyhzdHJ1Y3Qga21lbV9jYWNoZSAqY2FjaGUsCiB2b2lkICogX19tdXN0
X2NoZWNrIF9fa2FzYW5faW5pdF9zbGFiX29iaihzdHJ1Y3Qga21lbV9jYWNoZSAqY2FjaGUsCiAJ
CQkJCQljb25zdCB2b2lkICpvYmplY3QpCiB7Ci0JLyogSW5pdGlhbGl6ZSBwZXItb2JqZWN0IG1l
dGFkYXRhIGlmIGl0IGlzIHByZXNlbnQuICovCi0JaWYgKGthc2FuX3JlcXVpcmVzX21ldGEoKSkK
LQkJa2FzYW5faW5pdF9vYmplY3RfbWV0YShjYWNoZSwgb2JqZWN0KTsKLQogCS8qIFRhZyBpcyBp
Z25vcmVkIGluIHNldF90YWcoKSB3aXRob3V0IENPTkZJR19LQVNBTl9TVy9IV19UQUdTICovCiAJ
b2JqZWN0ID0gc2V0X3RhZyhvYmplY3QsIGFzc2lnbl90YWcoY2FjaGUsIG9iamVjdCwgdHJ1ZSkp
OwogCkBAIC0zMzgsNiArMzM0LDEwIEBAIHZvaWQgKiBfX211c3RfY2hlY2sgX19rYXNhbl9zbGFi
X2FsbG9jKHN0cnVjdCBrbWVtX2NhY2hlICpjYWNoZSwKIAlpZiAoaXNfa2ZlbmNlX2FkZHJlc3Mo
b2JqZWN0KSkKIAkJcmV0dXJuICh2b2lkICopb2JqZWN0OwogCisJLyogSW5pdGlhbGl6ZSBwZXIt
b2JqZWN0IG1ldGFkYXRhIGlmIGl0IGlzIHByZXNlbnQuICovCisJaWYgKGthc2FuX3JlcXVpcmVz
X21ldGEoKSkKKwkJa2FzYW5faW5pdF9vYmplY3RfbWV0YShjYWNoZSwgb2JqZWN0KTsKKwogCS8q
CiAJICogR2VuZXJhdGUgYW5kIGFzc2lnbiByYW5kb20gdGFnIGZvciB0YWctYmFzZWQgbW9kZXMu
CiAJICogVGFnIGlzIGlnbm9yZWQgaW4gc2V0X3RhZygpIGZvciB0aGUgZ2VuZXJpYyBtb2RlLgo=
--0000000000000aab15060e8585db--

