Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF9C41C010
	for <lists+linux-next@lfdr.de>; Wed, 29 Sep 2021 09:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244672AbhI2Hp1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Sep 2021 03:45:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244670AbhI2Hp1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Sep 2021 03:45:27 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFAD2C06161C;
        Wed, 29 Sep 2021 00:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=24SmOWetzAvOxP2dcreYPXwfzd9U4QZ2btizbsndRQg=; b=k9EvQTT981rpk3PgQ7/2lslTjK
        dk7soFavNfOx1Qw/j+SZt2d6EbEHqwdl0SOOiHocvZxIQ/OIyREVzs6tJw5Jyx/af9PRVQJkxNDhz
        f2AS2GlMXFopIdVhGZ5Ekq6NWz8wbWEJL315JSWlDJa6kouqq43aEF8DyflfnVkNqF75UZjV4rLV2
        KnTbUOvQApGITIsnyNPmo9B5Zoo71vePrNlPlff/NHwCr/zDbKP9ukHYZot755fvxoIYGUW9WkJM9
        n+91vDl4KfxqrxUjYdUsEyAIMJTogw58MzuP7BHmHIaPo8hMMtYRYbdkWfVX7oIXRd3rS3YiImK6k
        wn6IuZSQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mVUFg-006fQV-DU; Wed, 29 Sep 2021 07:43:40 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id BDDC030023F;
        Wed, 29 Sep 2021 09:43:39 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 77FD12BBF9842; Wed, 29 Sep 2021 09:43:39 +0200 (CEST)
Date:   Wed, 29 Sep 2021 09:43:39 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <YVQZK55afxgV9l6r@hirez.programming.kicks-ass.net>
References: <20210929150052.41ca3989@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210929150052.41ca3989@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 29, 2021 at 03:00:52PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>=20
> vmlinux.o: warning: objtool: .altinstructions+0x171b4: don't know how to =
handle non-section reloc symbol do_swap
>=20
> I don't know where this came from, and it started before today was
> hidden by other warnings.

Yeah, it started showing up somewhere recently, I've had it on the todo
list and finally got around to looking at it last night. I've got the
below before calling it quits for the day.

I'll go see if it still makes sense to me after waking up, and then I'll
go write a Changelog.


diff --git a/tools/objtool/special.c b/tools/objtool/special.c
index bc925cf19e2d..fa7cff2bfe77 100644
--- a/tools/objtool/special.c
+++ b/tools/objtool/special.c
@@ -91,15 +91,23 @@ static int get_alt_entry(struct elf *elf, struct specia=
l_entry *entry,
 		WARN_FUNC("can't find orig reloc", sec, offset + entry->orig);
 		return -1;
 	}
-	if (orig_reloc->sym->type !=3D STT_SECTION) {
-		WARN_FUNC("don't know how to handle non-section reloc symbol %s",
+	switch (orig_reloc->sym->type) {
+	case STT_FUNC:
+		alt->orig_sec =3D orig_reloc->sym->sec;
+		alt->orig_off =3D orig_reloc->sym->offset + orig_reloc->addend;
+		break;
+
+	case STT_SECTION:
+		alt->orig_sec =3D orig_reloc->sym->sec;
+		alt->orig_off =3D orig_reloc->addend;
+		break;
+
+	default:
+		WARN_FUNC("don't know how to handle reloc symbol type: %s",
 			   sec, offset + entry->orig, orig_reloc->sym->name);
 		return -1;
 	}
=20
-	alt->orig_sec =3D orig_reloc->sym->sec;
-	alt->orig_off =3D orig_reloc->addend;
-
 	if (!entry->group || alt->new_len) {
 		new_reloc =3D find_reloc_by_dest(elf, sec, offset + entry->new);
 		if (!new_reloc) {
