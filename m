Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E200ADED25
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 15:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfJUNMA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 09:12:00 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53290 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727256AbfJUNMA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Oct 2019 09:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=jloJkGKa7vU+GU78XngxyOagGSBHzTSvvyehxGuzF5c=; b=XbW1uAJbpB7Sb+2QkV/fEj2KI
        mwRsqffCphhzWGJAzmvRSmqNsSgHYdImobSU0mUktzxMjKgE9WOaGdTunQmagUIDvHU5B1sED51Il
        fhvuQHQG42qqbRVMwG2PskDmbHzxtR4NYqAgIgyPoR9hGC5hENFNc1wC8papO6TLm0TiMFyvZPdbG
        eyV+7SBXWwI9ABlwd+O8ccWdI+qjpQLSvKj64lDUgeVTqWcs1zXucrlWT5z76d5dgMromovv+sNU0
        4nzYkSY1ADiksK8kJiPYk30BRWfqUC0vikL0foLTRbIMhmlDe/XSKrAqV3bsRWtbWgLtDiS4wSH+Q
        5mYXBq0PQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iMXTU-0001v0-3e; Mon, 21 Oct 2019 13:11:52 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D78F9300EBF;
        Mon, 21 Oct 2019 15:10:52 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id EF4B220D9A729; Mon, 21 Oct 2019 15:11:49 +0200 (CEST)
Date:   Mon, 21 Oct 2019 15:11:49 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>, linux@rasmusvillemoes.dk,
        cyphar@cyphar.com, keescook@chromium.org,
        christian.brauner@ubuntu.com
Subject: Re: linux-next: Tree for Oct 18 (objtool)
Message-ID: <20191021131149.GA19358@hirez.programming.kicks-ass.net>
References: <20191018180300.090dbcb9@canb.auug.org.au>
 <40de4e26-450e-b932-3d73-e833c8aeaa2e@infradead.org>
 <20191021123549.GC1817@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021123549.GC1817@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 21, 2019 at 02:35:49PM +0200, Peter Zijlstra wrote:
> On Fri, Oct 18, 2019 at 08:33:11AM -0700, Randy Dunlap wrote:
> > On 10/18/19 12:03 AM, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20191017:
> > > 
> > 
> > on x86_64:
> > lib/usercopy.o: warning: objtool: check_zeroed_user()+0x35f: call to __ubsan_handle_shift_out_of_bounds() with UACCESS enabled
> 
> Blergh... I suppose the below will fix that. I'm a bit conflicted on it
> though, the alternative is annotating more ubsan crud.

By popular request; here's that alternative. Completely untested :-)

---
 lib/ubsan.c           | 5 ++++-
 tools/objtool/check.c | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/ubsan.c b/lib/ubsan.c
index 39d5952c4273..0dce3ff45b5b 100644
--- a/lib/ubsan.c
+++ b/lib/ubsan.c
@@ -359,9 +359,10 @@ void __ubsan_handle_shift_out_of_bounds(struct shift_out_of_bounds_data *data,
 	struct type_descriptor *lhs_type = data->lhs_type;
 	char rhs_str[VALUE_LENGTH];
 	char lhs_str[VALUE_LENGTH];
+	unsigned long flags = user_access_save();
 
 	if (suppress_report(&data->location))
-		return;
+		goto out;
 
 	ubsan_prologue(&data->location);
 
@@ -387,6 +388,8 @@ void __ubsan_handle_shift_out_of_bounds(struct shift_out_of_bounds_data *data,
 			lhs_type->type_name);
 
 	ubsan_epilogue();
+out:
+	user_access_restore(flags);
 }
 EXPORT_SYMBOL(__ubsan_handle_shift_out_of_bounds);
 
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 543c068096b1..4768d91c6d68 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -482,6 +482,7 @@ static const char *uaccess_safe_builtin[] = {
 	"ubsan_type_mismatch_common",
 	"__ubsan_handle_type_mismatch",
 	"__ubsan_handle_type_mismatch_v1",
+	"__ubsan_handle_shift_out_of_bounds",
 	/* misc */
 	"csum_partial_copy_generic",
 	"__memcpy_mcsafe",
