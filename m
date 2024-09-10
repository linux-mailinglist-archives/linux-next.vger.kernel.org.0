Return-Path: <linux-next+bounces-3729-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE1F973928
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 15:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6D1A1F26136
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 13:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF044192B9C;
	Tue, 10 Sep 2024 13:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hrNbcFcM"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D9318E11;
	Tue, 10 Sep 2024 13:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725976622; cv=none; b=iWMghnt1sbmqaZKnqrZWjtTri5alWWoQ52LNm0S20gFlXcrkCescHDHp/sQs9EFw/BnJPixPFolHH3jawbaWhc2R4AB9ovg/aGhKz9Qn6x05Cm5ND/2eMUv6YR0vKv57E61E42IL41VLc+A6i2WKum9l8YWCyQXbgztCZCPAAi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725976622; c=relaxed/simple;
	bh=tTCBghv41xs9ZjJKwgXRHRlKXz95cpZEmG+choe5cNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkzZRf6NMgXMC+q/HilfnLA8trnfH5922cCjXo9bI8r2888mWVlV4M4VSS+dqslHuHKIFzphNXPRQbJ66QvXHUkna7BOewWByLkHwrfZkovCHU2hwSM4wE+5mS0iLnJxoN7hk7bMeUhW9c5UmPx0Xo8x0lAR0itdaI0LiYSoqiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hrNbcFcM; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kcIXoC8KuI2mGr8wY7QewEsxmtlsomE6vt2blzLRVgM=; b=hrNbcFcMEVhNgIIAH/pYfkw8ia
	3KzGYTb2gB0Av6htUG7wcjxycls951YukXKmDpyBukJRCPlJlzitapo1n/NUQ/fEDCWzVzGvXB/bu
	k6jhj7Y81IGCprxjr/JGUQXF70ZjAu4sgxqf/yeAYEzFmbHE1/81YQq2lRiHLWodUeeeybqB5JyVQ
	k+qtrXhZDAu1lw/OuWFBfeXdEOG9YECtmglqF1ZybGU6sdmsKu+QigBi0S187Q4sZYxEsTKX5OotZ
	I0ZaL4YHN5qWyR8PtXagETYxK1BBfn6ZNoon86L6NhfXaGQT53GFvsOQhsFPGJvwHSVA0izrmcLSt
	LMB6myNg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1so1MZ-0000000BW2C-18eU;
	Tue, 10 Sep 2024 13:56:59 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 58FF230047C; Tue, 10 Sep 2024 15:56:58 +0200 (CEST)
Date: Tue, 10 Sep 2024 15:56:58 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Bert Karwatzki <spasswolf@web.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	"Darrick J . Wong" <djwong@kernel.org>, x86@kernel.org,
	chandanbabu@kernel.org, willy@infradead.org
Subject: Re: commit de752774f38bb causes fatal error on boot
Message-ID: <20240910135658.GG4723@noisy.programming.kicks-ass.net>
References: <20240910111111.2591-1-spasswolf@web.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910111111.2591-1-spasswolf@web.de>

On Tue, Sep 10, 2024 at 01:11:09PM +0200, Bert Karwatzki wrote:
> When booting linux-next-20240910 on my MSI alpha 15 Laptop running debian sid (amd64),
> I get dropped to a shell and get the folllowing error in dmesg. I bisected this to
> commit de752774f38bb ("jump_label: Fix static_key_slow_dec() yet again").

I've just replaced that commit with the below -- which should be in
tomorrows tree:

---
commit 1d7f856c2ca449f04a22d876e36b464b7a9d28b6
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Mon Sep 9 12:50:09 2024 +0200

    jump_label: Fix static_key_slow_dec() yet again
    
    While commit 83ab38ef0a0b ("jump_label: Fix concurrency issues in
    static_key_slow_dec()") fixed one problem, it created yet another,
    notably the following is now possible:
    
      slow_dec
        if (try_dec) // dec_not_one-ish, false
        // enabled == 1
                                    slow_inc
                                      if (inc_not_disabled) // inc_not_zero-ish
                                      // enabled == 2
                                        return
    
        guard((mutex)(&jump_label_mutex);
        if (atomic_cmpxchg(1,0)==1) // false, we're 2
    
                                    slow_dec
                                      if (try-dec) // dec_not_one, true
                                      // enabled == 1
                                        return
        else
          try_dec() // dec_not_one, false
          WARN
    
    Use dec_and_test instead of cmpxchg(), like it was prior to
    83ab38ef0a0b. Add a few WARNs for the paranoid.
    
    Fixes: 83ab38ef0a0b ("jump_label: Fix concurrency issues in static_key_slow_dec()")
    Reported-by: "Darrick J. Wong" <djwong@kernel.org>
    Tested-by: Klara Modin <klarasmodin@gmail.com>
    Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

diff --git a/kernel/jump_label.c b/kernel/jump_label.c
index 6dc76b590703..93a822d3c468 100644
--- a/kernel/jump_label.c
+++ b/kernel/jump_label.c
@@ -168,7 +168,7 @@ bool static_key_slow_inc_cpuslocked(struct static_key *key)
 		jump_label_update(key);
 		/*
 		 * Ensure that when static_key_fast_inc_not_disabled() or
-		 * static_key_slow_try_dec() observe the positive value,
+		 * static_key_dec_not_one() observe the positive value,
 		 * they must also observe all the text changes.
 		 */
 		atomic_set_release(&key->enabled, 1);
@@ -250,7 +250,7 @@ void static_key_disable(struct static_key *key)
 }
 EXPORT_SYMBOL_GPL(static_key_disable);
 
-static bool static_key_slow_try_dec(struct static_key *key)
+static bool static_key_dec_not_one(struct static_key *key)
 {
 	int v;
 
@@ -274,6 +274,14 @@ static bool static_key_slow_try_dec(struct static_key *key)
 		 * enabled. This suggests an ordering problem on the user side.
 		 */
 		WARN_ON_ONCE(v < 0);
+
+		/*
+		 * Warn about underflow, and lie about success in an attempt to
+		 * not make things worse.
+		 */
+		if (WARN_ON_ONCE(v == 0))
+			return true;
+
 		if (v <= 1)
 			return false;
 	} while (!likely(atomic_try_cmpxchg(&key->enabled, &v, v - 1)));
@@ -284,15 +292,27 @@ static bool static_key_slow_try_dec(struct static_key *key)
 static void __static_key_slow_dec_cpuslocked(struct static_key *key)
 {
 	lockdep_assert_cpus_held();
+	int val;
 
-	if (static_key_slow_try_dec(key))
+	if (static_key_dec_not_one(key))
 		return;
 
 	guard(mutex)(&jump_label_mutex);
-	if (atomic_cmpxchg(&key->enabled, 1, 0) == 1)
+	val = atomic_read(&key->enabled);
+	/*
+	 * It should be impossible to observe -1 with jump_label_mutex held,
+	 * see static_key_slow_inc_cpuslocked().
+	 */
+	if (WARN_ON_ONCE(val == -1))
+		return;
+	/*
+	 * Cannot already be 0, something went sideways.
+	 */
+	if (WARN_ON_ONCE(val == 0))
+		return;
+
+	if (atomic_dec_and_test(&key->enabled))
 		jump_label_update(key);
-	else
-		WARN_ON_ONCE(!static_key_slow_try_dec(key));
 }
 
 static void __static_key_slow_dec(struct static_key *key)
@@ -329,7 +349,7 @@ void __static_key_slow_dec_deferred(struct static_key *key,
 {
 	STATIC_KEY_CHECK_USE(key);
 
-	if (static_key_slow_try_dec(key))
+	if (static_key_dec_not_one(key))
 		return;
 
 	schedule_delayed_work(work, timeout);

