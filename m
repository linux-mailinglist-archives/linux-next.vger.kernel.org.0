Return-Path: <linux-next+bounces-4816-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F8B9D31F2
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 02:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97BD4B238A1
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 01:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D378F5A;
	Wed, 20 Nov 2024 01:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wCP8IX/p"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FD5BA4B
	for <linux-next@vger.kernel.org>; Wed, 20 Nov 2024 01:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732067012; cv=none; b=QZ7+9+TsopMmNpM0S3wt9syVtmz/hdTnVCf1TDz/wLHtlo58aEkPadmQieMFvwRoaWQCzChj44T1PmMukW7mOkZwzueZUXznTV+sF7ChcMs7bqjhn7Uw1Q0TFBkS+TIJWQdKoiGL/stADemagDm1hJnMkeSL7IRZrDEBzmEqedM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732067012; c=relaxed/simple;
	bh=scpMwPeXZvNWv0ZtoucrzQ/HlbDuMl2+pH3j0Zgsaew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AkTo69LpXgk6RIYkDcjn9EDTg6pnBF355x15x61uRXew/BvAPlbmg17Kqu9gu34ImAKGefCrJ2nbiTSdpiS2nX4kg8UDWaFbg9zWIwWN5H6lXLJGow5crzloFm3fqGRrtsIS66P56wVpUjzBqw+rbgB1O0GsDf0EyoPPoiarIG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wCP8IX/p; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4608dddaa35so576921cf.0
        for <linux-next@vger.kernel.org>; Tue, 19 Nov 2024 17:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732067009; x=1732671809; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zte8Mvos0yCsXWWJxn9c6KpEtSyXLJ8ogL7Yw83+Ao0=;
        b=wCP8IX/paSITVPNFv24QHryj5dulvAzC73wFchELy7qA2wVI4LlpNLOvKwPp43JkL/
         +QGh34MnhDkbG+/1PxW6wx5PB/4uRoTSxUI7O9z3Go1s2oOUSvKqMGuIf60mylIj9Zu5
         m9Hp8q7dVKbIJNRVZmbDIiTCnApI3n5yd1yAbWnodxTU6xjJlz82P0nuPGAwBEWlA/rQ
         r5pwrSqfna3vl3DoJ4UjYdu+ZW0OohCpbqq7mhlQLqr4EigwyOUqfmVAeuqPQREULscW
         IWj276YOgisAlKKu6XGHg+vEQBByeQTXKG75vdPF3Z+WUec/KX+RqvcD2A2sgrQD8+5X
         VzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732067009; x=1732671809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zte8Mvos0yCsXWWJxn9c6KpEtSyXLJ8ogL7Yw83+Ao0=;
        b=CBEvai8Nr409yCa5aSxa8MLjJaQMJwpi90pta98eYvxqDKMz689Oz+HlFTYl8leRhx
         dliSugdBpVI/wMalyMbNxvhcHjuSb6hBfD3s1Ihx1UYG97ohjod7bT6AP39SUQ84Tg1I
         dX5WnyiRPn2ZlLxLB0OU1ty8yGlsDjkW3cTwWvag/8Msjld/u9Vw0N7KAv+t0AtMbzep
         belLTxZtHkC8PFga+owxsjQ1I9whA8i+OV4Kv0xmqaFd5m67vlO6wjW256FlMCqPkHrR
         oRL2EkTM8EAvJOgs/4dE3w1zNhscPFx3TrP5zGB/2YeQheajeeG1rmUOBnuqkV90naQg
         1cHw==
X-Forwarded-Encrypted: i=1; AJvYcCUXW0YCJ5wbpb/LQG22ea0/2yTzsJLUmwK1U+U7roZuq1rvnaTn3HKIyGVZXQvu2jMK7Wi4+4Q5cu51@vger.kernel.org
X-Gm-Message-State: AOJu0YzEtWxe3RNafHIgRxvGL3ZTzAwqpc22BnzUcFSnGeLfrZRItWwm
	BGTkCM3rimkoO5wVDorcmWq/qauSpxXdSyROM1Q/iiTnIIOcHrnCBcZWmVCq0qfwJNKG1Eag2jf
	qkeMLccXLa7jBAObcSOQi+u0mJB2/8AVU/LOs
X-Gm-Gg: ASbGncuwO2sDjO4n3atixRdLnsCGZRhgKfbKqFfN0Twiudffqx8ghoyIXpJ91qRpuxD
	QtvQh0Ur6Y3AwCPOHCIbWN3vJ4nxE0ZE=
X-Google-Smtp-Source: AGHT+IHaIBEjaoMEz70ediY09Oj1sMDoNhOA54MdFBy0m3ujuy9C+69jIBC4diDoGidztVmajbpCL9czZdG7AEW8q5w=
X-Received: by 2002:a05:622a:428e:b0:463:95bc:54cc with SMTP id
 d75a77b69052e-464d1c9f726mr615141cf.3.1732067009194; Tue, 19 Nov 2024
 17:43:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028111058.4419a9ed@canb.auug.org.au> <20241120120124.03f09ac5@canb.auug.org.au>
 <CAJuCfpGNKzBadFix9WpN-PQMr2Mwj1NjawzSk8ycBST9USKpcA@mail.gmail.com>
In-Reply-To: <CAJuCfpGNKzBadFix9WpN-PQMr2Mwj1NjawzSk8ycBST9USKpcA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 19 Nov 2024 17:43:18 -0800
Message-ID: <CAJuCfpGgqmdM27KUkH2Yf3pPkwxgktDpzYkOMrW=Xc96cxPfXA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: multipart/mixed; boundary="000000000000d06ef106274e4684"

--000000000000d06ef106274e4684
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 5:09=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Tue, Nov 19, 2024 at 5:01=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.o=
rg.au> wrote:
> >
> > Hi all,
> >
> > On Mon, 28 Oct 2024 11:10:58 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> > >
> > > Today's linux-next merge of the arm64 tree got a conflict in:
> > >
> > >   include/linux/mm.h
> > >
> > > between commit:
> > >
> > >   e87ec503cf2e ("mm/codetag: uninline and move pgalloc_tag_copy and p=
galloc_tag_split")
> > >
> > > from the mm-unstable branch of the mm tree and commit:
> > >
> > >   91e102e79740 ("prctl: arch-agnostic prctl for shadow stack")
> > >
> > > from the arm64 tree.
> > >
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your t=
ree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particula=
rly
> > > complex conflicts.
> > >
> > > --
> > > Cheers,
> > > Stephen Rothwell
> > >
> > > diff --cc include/linux/mm.h
> > > index 086ba524d3ba,8852c39c7695..000000000000
> > > --- a/include/linux/mm.h
> > > +++ b/include/linux/mm.h
> > > @@@ -4166,4 -4174,65 +4178,8 @@@ static inline int do_mseal(unsigned =
lon
> > >   }
> > >   #endif
> > >
> > >  -#ifdef CONFIG_MEM_ALLOC_PROFILING
> > >  -static inline void pgalloc_tag_split(struct folio *folio, int old_o=
rder, int new_order)
> > >  -{
> > >  -    int i;
> > >  -    struct alloc_tag *tag;
> > >  -    unsigned int nr_pages =3D 1 << new_order;
> > >  -
> > >  -    if (!mem_alloc_profiling_enabled())
> > >  -            return;
> > >  -
> > >  -    tag =3D pgalloc_tag_get(&folio->page);
> > >  -    if (!tag)
> > >  -            return;
> > >  -
> > >  -    for (i =3D nr_pages; i < (1 << old_order); i +=3D nr_pages) {
> > >  -            union codetag_ref *ref =3D get_page_tag_ref(folio_page(=
folio, i));
> > >  -
> > >  -            if (ref) {
> > >  -                    /* Set new reference to point to the original t=
ag */
> > >  -                    alloc_tag_ref_set(ref, tag);
> > >  -                    put_page_tag_ref(ref);
> > >  -            }
> > >  -    }
> > >  -}
> > >  -
> > >  -static inline void pgalloc_tag_copy(struct folio *new, struct folio=
 *old)
> > >  -{
> > >  -    struct alloc_tag *tag;
> > >  -    union codetag_ref *ref;
> > >  -
> > >  -    tag =3D pgalloc_tag_get(&old->page);
> > >  -    if (!tag)
> > >  -            return;
> > >  -
> > >  -    ref =3D get_page_tag_ref(&new->page);
> > >  -    if (!ref)
> > >  -            return;
> > >  -
> > >  -    /* Clear the old ref to the original allocation tag. */
> > >  -    clear_page_tag_ref(&old->page);
> > >  -    /* Decrement the counters of the tag on get_new_folio. */
> > >  -    alloc_tag_sub(ref, folio_nr_pages(new));
> > >  -
> > >  -    __alloc_tag_ref_set(ref, tag);
> > >  -
> > >  -    put_page_tag_ref(ref);
> > >  -}
> > >  -#else /* !CONFIG_MEM_ALLOC_PROFILING */
> > >  -static inline void pgalloc_tag_split(struct folio *folio, int old_o=
rder, int new_order)
> > >  -{
> > >  -}
> > >  -
> > >  -static inline void pgalloc_tag_copy(struct folio *new, struct folio=
 *old)
> > >  -{
> > >  -}
> > >  -#endif /* CONFIG_MEM_ALLOC_PROFILING */
> > >  -
> > > + int arch_get_shadow_stack_status(struct task_struct *t, unsigned lo=
ng __user *status);
> > > + int arch_set_shadow_stack_status(struct task_struct *t, unsigned lo=
ng status);
> > > + int arch_lock_shadow_stack_status(struct task_struct *t, unsigned l=
ong status);
> > > +
> > >   #endif /* _LINUX_MM_H */
> >
> > This is now a conflict between the mm-stable tree and Linus' tree.
>
> Let me try to manually apply it to Linus' ToT and will send a replacement=
 patch.

Attached patch should apply to Linus' tree but please make sure the
following two patches from mm-stable are merged before this one
because there are dependencies between them:

ed265529d39a mm/codetag: fix arg in pgalloc_tag_copy alloc_tag_sub
42895a861244 alloc_tag: introduce pgtag_ref_handle to abstract page
tag references

>
> >
> > --
> > Cheers,
> > Stephen Rothwell

--000000000000d06ef106274e4684
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-mm-codetag-uninline-and-move-pgalloc_tag_copy-and-pg.patch"
Content-Disposition: attachment; 
	filename="0001-mm-codetag-uninline-and-move-pgalloc_tag_copy-and-pg.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m3p7ykhl0>
X-Attachment-Id: f_m3p7ykhl0

RnJvbSBhOWRmNzdjZGM0MmMwNmIwNjhmNzgyYjQ3MzM4NTU0MTNkMmZmOTI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29t
PgpEYXRlOiBUaHUsIDI0IE9jdCAyMDI0IDA5OjIzOjE4IC0wNzAwClN1YmplY3Q6IFtQQVRDSCAx
LzFdIG1tL2NvZGV0YWc6IHVuaW5saW5lIGFuZCBtb3ZlIHBnYWxsb2NfdGFnX2NvcHkgYW5kCiBw
Z2FsbG9jX3RhZ19zcGxpdAoKcGdhbGxvY190YWdfY29weSgpIGFuZCBwZ2FsbG9jX3RhZ19zcGxp
dCgpIGFyZSBzaXphYmxlIGFuZCBvdXRzaWRlIG9mIGFueQpwZXJmb3JtYW5jZS1jcml0aWNhbCBw
YXRocywgc28gaXQgc2hvdWxkIGJlIGZpbmUgdG8gdW5pbmxpbmUgdGhlbS4gIEFsc28KbW92ZSB0
aGVpciBkZWNsYXJhdGlvbnMgaW50byBwZ2FsbG9jX3RhZy5oIHdoaWNoIHNlZW1zIGxpa2UgYSBt
b3JlCmFwcHJvcHJpYXRlIHBsYWNlIGZvciB0aGVtLiAgTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIG90
aGVyIHRoYW4gdW5pbmxpbmluZy4KCkxpbms6IGh0dHBzOi8vbGttbC5rZXJuZWwub3JnL3IvMjAy
NDEwMjQxNjIzMTguMTY0MDc4MS0xLXN1cmVuYkBnb29nbGUuY29tClNpZ25lZC1vZmYtYnk6IFN1
cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+ClN1Z2dlc3RlZC1ieTogQW5kcmV3
IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQWNrZWQtYnk6IFl1IFpoYW8gPHl1
emhhb0Bnb29nbGUuY29tPgpDYzogS2VudCBPdmVyc3RyZWV0IDxrZW50Lm92ZXJzdHJlZXRAbGlu
dXguZGV2PgpDYzogUGFzaGEgVGF0YXNoaW4gPHBhc2hhLnRhdGFzaGluQHNvbGVlbi5jb20+CkNj
OiBTb3VyYXYgUGFuZGEgPHNvdXJhdnBhbmRhQGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Ci0tLQogaW5jbHVkZS9saW51
eC9tbS5oICAgICAgICAgIHwgNTggLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogaW5jbHVkZS9saW51eC9wZ2FsbG9jX3RhZy5oIHwgIDUgKysrKwogbGliL2FsbG9jX3RhZy5j
ICAgICAgICAgICAgIHwgNDggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAzIGZpbGVz
IGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDU4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgvbW0uaAppbmRleCBjMzZkYzQ0YWI5
MWYuLjhiYWQ3OTE4ZjVkOSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tbS5oCisrKyBiL2lu
Y2x1ZGUvbGludXgvbW0uaApAQCAtNDE3NSw2NCArNDE3NSw2IEBAIHN0YXRpYyBpbmxpbmUgaW50
IGRvX21zZWFsKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHNpemVfdCBsZW5faW4sIHVuc2lnbmVkIGxv
bmcgZmxhCiB9CiAjZW5kaWYKIAotI2lmZGVmIENPTkZJR19NRU1fQUxMT0NfUFJPRklMSU5HCi1z
dGF0aWMgaW5saW5lIHZvaWQgcGdhbGxvY190YWdfc3BsaXQoc3RydWN0IGZvbGlvICpmb2xpbywg
aW50IG9sZF9vcmRlciwgaW50IG5ld19vcmRlcikKLXsKLQlpbnQgaTsKLQlzdHJ1Y3QgYWxsb2Nf
dGFnICp0YWc7Ci0JdW5zaWduZWQgaW50IG5yX3BhZ2VzID0gMSA8PCBuZXdfb3JkZXI7Ci0KLQlp
ZiAoIW1lbV9hbGxvY19wcm9maWxpbmdfZW5hYmxlZCgpKQotCQlyZXR1cm47Ci0KLQl0YWcgPSBw
Z2FsbG9jX3RhZ19nZXQoJmZvbGlvLT5wYWdlKTsKLQlpZiAoIXRhZykKLQkJcmV0dXJuOwotCi0J
Zm9yIChpID0gbnJfcGFnZXM7IGkgPCAoMSA8PCBvbGRfb3JkZXIpOyBpICs9IG5yX3BhZ2VzKSB7
Ci0JCXVuaW9uIHBndGFnX3JlZl9oYW5kbGUgaGFuZGxlOwotCQl1bmlvbiBjb2RldGFnX3JlZiBy
ZWY7Ci0KLQkJaWYgKGdldF9wYWdlX3RhZ19yZWYoZm9saW9fcGFnZShmb2xpbywgaSksICZyZWYs
ICZoYW5kbGUpKSB7Ci0JCQkvKiBTZXQgbmV3IHJlZmVyZW5jZSB0byBwb2ludCB0byB0aGUgb3Jp
Z2luYWwgdGFnICovCi0JCQlhbGxvY190YWdfcmVmX3NldCgmcmVmLCB0YWcpOwotCQkJdXBkYXRl
X3BhZ2VfdGFnX3JlZihoYW5kbGUsICZyZWYpOwotCQkJcHV0X3BhZ2VfdGFnX3JlZihoYW5kbGUp
OwotCQl9Ci0JfQotfQotCi1zdGF0aWMgaW5saW5lIHZvaWQgcGdhbGxvY190YWdfY29weShzdHJ1
Y3QgZm9saW8gKm5ldywgc3RydWN0IGZvbGlvICpvbGQpCi17Ci0JdW5pb24gcGd0YWdfcmVmX2hh
bmRsZSBoYW5kbGU7Ci0JdW5pb24gY29kZXRhZ19yZWYgcmVmOwotCXN0cnVjdCBhbGxvY190YWcg
KnRhZzsKLQotCXRhZyA9IHBnYWxsb2NfdGFnX2dldCgmb2xkLT5wYWdlKTsKLQlpZiAoIXRhZykK
LQkJcmV0dXJuOwotCi0JaWYgKCFnZXRfcGFnZV90YWdfcmVmKCZuZXctPnBhZ2UsICZyZWYsICZo
YW5kbGUpKQotCQlyZXR1cm47Ci0KLQkvKiBDbGVhciB0aGUgb2xkIHJlZiB0byB0aGUgb3JpZ2lu
YWwgYWxsb2NhdGlvbiB0YWcuICovCi0JY2xlYXJfcGFnZV90YWdfcmVmKCZvbGQtPnBhZ2UpOwot
CS8qIERlY3JlbWVudCB0aGUgY291bnRlcnMgb2YgdGhlIHRhZyBvbiBnZXRfbmV3X2ZvbGlvLiAq
LwotCWFsbG9jX3RhZ19zdWIoJnJlZiwgZm9saW9fc2l6ZShuZXcpKTsKLQlfX2FsbG9jX3RhZ19y
ZWZfc2V0KCZyZWYsIHRhZyk7Ci0JdXBkYXRlX3BhZ2VfdGFnX3JlZihoYW5kbGUsICZyZWYpOwot
CXB1dF9wYWdlX3RhZ19yZWYoaGFuZGxlKTsKLX0KLSNlbHNlIC8qICFDT05GSUdfTUVNX0FMTE9D
X1BST0ZJTElORyAqLwotc3RhdGljIGlubGluZSB2b2lkIHBnYWxsb2NfdGFnX3NwbGl0KHN0cnVj
dCBmb2xpbyAqZm9saW8sIGludCBvbGRfb3JkZXIsIGludCBuZXdfb3JkZXIpCi17Ci19Ci0KLXN0
YXRpYyBpbmxpbmUgdm9pZCBwZ2FsbG9jX3RhZ19jb3B5KHN0cnVjdCBmb2xpbyAqbmV3LCBzdHJ1
Y3QgZm9saW8gKm9sZCkKLXsKLX0KLSNlbmRpZiAvKiBDT05GSUdfTUVNX0FMTE9DX1BST0ZJTElO
RyAqLwotCiBpbnQgYXJjaF9nZXRfc2hhZG93X3N0YWNrX3N0YXR1cyhzdHJ1Y3QgdGFza19zdHJ1
Y3QgKnQsIHVuc2lnbmVkIGxvbmcgX191c2VyICpzdGF0dXMpOwogaW50IGFyY2hfc2V0X3NoYWRv
d19zdGFja19zdGF0dXMoc3RydWN0IHRhc2tfc3RydWN0ICp0LCB1bnNpZ25lZCBsb25nIHN0YXR1
cyk7CiBpbnQgYXJjaF9sb2NrX3NoYWRvd19zdGFja19zdGF0dXMoc3RydWN0IHRhc2tfc3RydWN0
ICp0LCB1bnNpZ25lZCBsb25nIHN0YXR1cyk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3Bn
YWxsb2NfdGFnLmggYi9pbmNsdWRlL2xpbnV4L3BnYWxsb2NfdGFnLmgKaW5kZXggYjEzY2QzMzEz
YTg4Li5hOTQyYjVhMDNlYmYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvcGdhbGxvY190YWcu
aAorKysgYi9pbmNsdWRlL2xpbnV4L3BnYWxsb2NfdGFnLmgKQEAgLTEyMiw2ICsxMjIsOSBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgcGdhbGxvY190YWdfc3ViX3BhZ2VzKHN0cnVjdCBhbGxvY190YWcg
KnRhZywgdW5zaWduZWQgaW50IG5yKQogCQl0aGlzX2NwdV9zdWIodGFnLT5jb3VudGVycy0+Ynl0
ZXMsIFBBR0VfU0laRSAqIG5yKTsKIH0KIAordm9pZCBwZ2FsbG9jX3RhZ19zcGxpdChzdHJ1Y3Qg
Zm9saW8gKmZvbGlvLCBpbnQgb2xkX29yZGVyLCBpbnQgbmV3X29yZGVyKTsKK3ZvaWQgcGdhbGxv
Y190YWdfY29weShzdHJ1Y3QgZm9saW8gKm5ldywgc3RydWN0IGZvbGlvICpvbGQpOworCiAjZWxz
ZSAvKiBDT05GSUdfTUVNX0FMTE9DX1BST0ZJTElORyAqLwogCiBzdGF0aWMgaW5saW5lIHZvaWQg
Y2xlYXJfcGFnZV90YWdfcmVmKHN0cnVjdCBwYWdlICpwYWdlKSB7fQpAQCAtMTMwLDYgKzEzMyw4
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwZ2FsbG9jX3RhZ19hZGQoc3RydWN0IHBhZ2UgKnBhZ2Us
IHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywKIHN0YXRpYyBpbmxpbmUgdm9pZCBwZ2FsbG9jX3Rh
Z19zdWIoc3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIGludCBucikge30KIHN0YXRpYyBpbmxp
bmUgc3RydWN0IGFsbG9jX3RhZyAqcGdhbGxvY190YWdfZ2V0KHN0cnVjdCBwYWdlICpwYWdlKSB7
IHJldHVybiBOVUxMOyB9CiBzdGF0aWMgaW5saW5lIHZvaWQgcGdhbGxvY190YWdfc3ViX3BhZ2Vz
KHN0cnVjdCBhbGxvY190YWcgKnRhZywgdW5zaWduZWQgaW50IG5yKSB7fQorc3RhdGljIGlubGlu
ZSB2b2lkIHBnYWxsb2NfdGFnX3NwbGl0KHN0cnVjdCBmb2xpbyAqZm9saW8sIGludCBvbGRfb3Jk
ZXIsIGludCBuZXdfb3JkZXIpIHt9CitzdGF0aWMgaW5saW5lIHZvaWQgcGdhbGxvY190YWdfY29w
eShzdHJ1Y3QgZm9saW8gKm5ldywgc3RydWN0IGZvbGlvICpvbGQpIHt9CiAKICNlbmRpZiAvKiBD
T05GSUdfTUVNX0FMTE9DX1BST0ZJTElORyAqLwogCmRpZmYgLS1naXQgYS9saWIvYWxsb2NfdGFn
LmMgYi9saWIvYWxsb2NfdGFnLmMKaW5kZXggODFlNWY5YTcwZjIyLi5mMjc5MDI3MmE2MDMgMTAw
NjQ0Ci0tLSBhL2xpYi9hbGxvY190YWcuYworKysgYi9saWIvYWxsb2NfdGFnLmMKQEAgLTE0NCw2
ICsxNDQsNTQgQEAgc2l6ZV90IGFsbG9jX3RhZ190b3BfdXNlcnMoc3RydWN0IGNvZGV0YWdfYnl0
ZXMgKnRhZ3MsIHNpemVfdCBjb3VudCwgYm9vbCBjYW5fc2wKIAlyZXR1cm4gbnI7CiB9CiAKK3Zv
aWQgcGdhbGxvY190YWdfc3BsaXQoc3RydWN0IGZvbGlvICpmb2xpbywgaW50IG9sZF9vcmRlciwg
aW50IG5ld19vcmRlcikKK3sKKwlpbnQgaTsKKwlzdHJ1Y3QgYWxsb2NfdGFnICp0YWc7CisJdW5z
aWduZWQgaW50IG5yX3BhZ2VzID0gMSA8PCBuZXdfb3JkZXI7CisKKwlpZiAoIW1lbV9hbGxvY19w
cm9maWxpbmdfZW5hYmxlZCgpKQorCQlyZXR1cm47CisKKwl0YWcgPSBwZ2FsbG9jX3RhZ19nZXQo
JmZvbGlvLT5wYWdlKTsKKwlpZiAoIXRhZykKKwkJcmV0dXJuOworCisJZm9yIChpID0gbnJfcGFn
ZXM7IGkgPCAoMSA8PCBvbGRfb3JkZXIpOyBpICs9IG5yX3BhZ2VzKSB7CisJCXVuaW9uIHBndGFn
X3JlZl9oYW5kbGUgaGFuZGxlOworCQl1bmlvbiBjb2RldGFnX3JlZiByZWY7CisKKwkJaWYgKGdl
dF9wYWdlX3RhZ19yZWYoZm9saW9fcGFnZShmb2xpbywgaSksICZyZWYsICZoYW5kbGUpKSB7CisJ
CQkvKiBTZXQgbmV3IHJlZmVyZW5jZSB0byBwb2ludCB0byB0aGUgb3JpZ2luYWwgdGFnICovCisJ
CQlhbGxvY190YWdfcmVmX3NldCgmcmVmLCB0YWcpOworCQkJdXBkYXRlX3BhZ2VfdGFnX3JlZiho
YW5kbGUsICZyZWYpOworCQkJcHV0X3BhZ2VfdGFnX3JlZihoYW5kbGUpOworCQl9CisJfQorfQor
Cit2b2lkIHBnYWxsb2NfdGFnX2NvcHkoc3RydWN0IGZvbGlvICpuZXcsIHN0cnVjdCBmb2xpbyAq
b2xkKQoreworCXVuaW9uIHBndGFnX3JlZl9oYW5kbGUgaGFuZGxlOworCXVuaW9uIGNvZGV0YWdf
cmVmIHJlZjsKKwlzdHJ1Y3QgYWxsb2NfdGFnICp0YWc7CisKKwl0YWcgPSBwZ2FsbG9jX3RhZ19n
ZXQoJm9sZC0+cGFnZSk7CisJaWYgKCF0YWcpCisJCXJldHVybjsKKworCWlmICghZ2V0X3BhZ2Vf
dGFnX3JlZigmbmV3LT5wYWdlLCAmcmVmLCAmaGFuZGxlKSkKKwkJcmV0dXJuOworCisJLyogQ2xl
YXIgdGhlIG9sZCByZWYgdG8gdGhlIG9yaWdpbmFsIGFsbG9jYXRpb24gdGFnLiAqLworCWNsZWFy
X3BhZ2VfdGFnX3JlZigmb2xkLT5wYWdlKTsKKwkvKiBEZWNyZW1lbnQgdGhlIGNvdW50ZXJzIG9m
IHRoZSB0YWcgb24gZ2V0X25ld19mb2xpby4gKi8KKwlhbGxvY190YWdfc3ViKCZyZWYsIGZvbGlv
X3NpemUobmV3KSk7CisJX19hbGxvY190YWdfcmVmX3NldCgmcmVmLCB0YWcpOworCXVwZGF0ZV9w
YWdlX3RhZ19yZWYoaGFuZGxlLCAmcmVmKTsKKwlwdXRfcGFnZV90YWdfcmVmKGhhbmRsZSk7Cit9
CisKIHN0YXRpYyB2b2lkIF9faW5pdCBwcm9jZnNfaW5pdCh2b2lkKQogewogCXByb2NfY3JlYXRl
X3NlcSgiYWxsb2NpbmZvIiwgMDQwMCwgTlVMTCwgJmFsbG9jaW5mb19zZXFfb3ApOwotLSAKMi40
Ny4wLjMzOC5nNjBjY2ExNTgxOS1nb29nCgo=
--000000000000d06ef106274e4684--

