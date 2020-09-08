Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4CC26105B
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 12:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729603AbgIHK6n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 06:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729125AbgIHK6F (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2020 06:58:05 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D27C061573;
        Tue,  8 Sep 2020 03:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=h0VvsYSE+w3nFKH9YA+g18tRVTSKMLX/aErXMNaKl3o=; b=cVBATJMnNT7ngYwKMX50JOE42s
        w38L4tGQY28hDLRNIXlIkkftUq/sBQfzuP7UOR07E+tF8u1i5SeGvsBqoWNn/oLBddhUImsB3w2KP
        233TSw6q9lHcauEnzc4OAQNMIb6VNP0fwm0midNEEVVEKaCSzgitu/m7UPQZtwCjrIOn9bcUbjLW3
        4k1UwS/1hED6NWgpN0lk2j/zMJPXANny1rIHdViofPpZ/uKMb8gO7OkGsWkS5zAJ4plzNDON1dYQw
        rVMvE8xaAjGijkNJ1OR3XVbjTQlw37Fxir17521GQRZCG8VZqoVrO4QbmW9SqkZ/P7RTFP8sxEMNe
        AU6F1ORw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kFbJq-0008Mk-3L; Tue, 08 Sep 2020 10:57:48 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 82AEC3010D2;
        Tue,  8 Sep 2020 12:57:43 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 2AF8A23D54AA4; Tue,  8 Sep 2020 12:57:43 +0200 (CEST)
Date:   Tue, 8 Sep 2020 12:57:43 +0200
From:   peterz@infradead.org
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200908105743.GW2674@hirez.programming.kicks-ass.net>
References: <20200908191223.0e7a9640@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200908191223.0e7a9640@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 08, 2020 at 07:12:23PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the tip tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> ERROR: modpost: too long symbol ".__tracepoint_iter_pnfs_mds_fallback_pg_=
get_mirror_count" [fs/nfs/flexfilelayout/nfs_layout_flexfiles.ko]
>=20
> Caused by commit
>=20
>   d25e37d89dd2 ("tracepoint: Optimize using static_call()")
>=20
> Exported symbols need to be <=3D (64 - sizeof(Elf_Addr)) long.  This is
> presumably 56 on 64 bit arches and the above symbol (including the '.')
> is 56 characters long.

I suppose something like the below ought to cure that. Still, stupid
long tracename that.

---

diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index 3722a10fc46d..81fa0b2f271e 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -154,7 +154,7 @@ static inline struct tracepoint *tracepoint_ptr_deref(t=
racepoint_ptr_t *p)
 #ifdef CONFIG_HAVE_STATIC_CALL
 #define __DO_TRACE_CALL(name)	static_call(tp_func_##name)
 #else
-#define __DO_TRACE_CALL(name)	__tracepoint_iter_##name
+#define __DO_TRACE_CALL(name)	__traceiter_##name
 #endif /* CONFIG_HAVE_STATIC_CALL */
=20
 /*
@@ -232,8 +232,8 @@ static inline struct tracepoint *tracepoint_ptr_deref(t=
racepoint_ptr_t *p)
  * poking RCU a bit.
  */
 #define __DECLARE_TRACE(name, proto, args, cond, data_proto, data_args) \
-	extern int __tracepoint_iter_##name(data_proto);		\
-	DECLARE_STATIC_CALL(tp_func_##name, __tracepoint_iter_##name); \
+	extern int __traceiter_##name(data_proto);			\
+	DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);	\
 	extern struct tracepoint __tracepoint_##name;			\
 	static inline void trace_##name(proto)				\
 	{								\
@@ -288,19 +288,19 @@ static inline struct tracepoint *tracepoint_ptr_deref=
(tracepoint_ptr_t *p)
 	static const char __tpstrtab_##_name[]				\
 	__section(__tracepoints_strings) =3D #_name;			\
 	extern struct static_call_key STATIC_CALL_KEY(tp_func_##_name);	\
-	int __tracepoint_iter_##_name(void *__data, proto);		\
+	int __traceiter_##_name(void *__data, proto);			\
 	struct tracepoint __tracepoint_##_name	__used			\
 	__section(__tracepoints) =3D {					\
 		.name =3D __tpstrtab_##_name,				\
 		.key =3D STATIC_KEY_INIT_FALSE,				\
 		.static_call_key =3D &STATIC_CALL_KEY(tp_func_##_name),	\
 		.static_call_tramp =3D STATIC_CALL_TRAMP_ADDR(tp_func_##_name), \
-		.iterator =3D &__tracepoint_iter_##_name,			\
+		.iterator =3D &__traceiter_##_name,			\
 		.regfunc =3D _reg,					\
 		.unregfunc =3D _unreg,					\
 		.funcs =3D NULL };					\
 	__TRACEPOINT_ENTRY(_name);					\
-	int __tracepoint_iter_##_name(void *__data, proto)		\
+	int __traceiter_##_name(void *__data, proto)			\
 	{								\
 		struct tracepoint_func *it_func_ptr;			\
 		void *it_func;						\
@@ -314,18 +314,18 @@ static inline struct tracepoint *tracepoint_ptr_deref=
(tracepoint_ptr_t *p)
 		} while ((++it_func_ptr)->func);			\
 		return 0;						\
 	}								\
-	DEFINE_STATIC_CALL(tp_func_##_name, __tracepoint_iter_##_name);
+	DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
=20
 #define DEFINE_TRACE(name, proto, args)		\
 	DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
=20
 #define EXPORT_TRACEPOINT_SYMBOL_GPL(name)				\
 	EXPORT_SYMBOL_GPL(__tracepoint_##name);				\
-	EXPORT_SYMBOL_GPL(__tracepoint_iter_##name);			\
+	EXPORT_SYMBOL_GPL(__traceiter_##name);				\
 	EXPORT_STATIC_CALL_GPL(tp_func_##name)
 #define EXPORT_TRACEPOINT_SYMBOL(name)					\
 	EXPORT_SYMBOL(__tracepoint_##name);				\
-	EXPORT_SYMBOL(__tracepoint_iter_##name);			\
+	EXPORT_SYMBOL(__traceiter_##name);				\
 	EXPORT_STATIC_CALL(tp_func_##name)
=20
=20
