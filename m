Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2032411C604
	for <lists+linux-next@lfdr.de>; Thu, 12 Dec 2019 07:39:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbfLLGis (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Dec 2019 01:38:48 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:34283 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbfLLGir (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Dec 2019 01:38:47 -0500
Received: by mail-yw1-f68.google.com with SMTP id b186so401095ywc.1
        for <linux-next@vger.kernel.org>; Wed, 11 Dec 2019 22:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CT9GqLY0BruZCbulKamF3sFh9+aJmP2cftODhJk3Kmw=;
        b=LkKTzoYcK1WRgGiSaCvg4nYYXbMvvd5ppeJD0PK1aaTFFl1pcQp0HIdTW+66kT0V4W
         AMviqBFr0HpIaPdfXHSEVAQ4z5z6LaDOxO9LzMK1+YDvBU/54VPCQn80KArS9PzW/cek
         2vyRsxGVKeey8FZyXRJy54EFtGzdugjUXeLXPrmt0ofz11LuyVQckNlt4j89FSBN9Bjv
         xdA6JCOYND5bvpAPHlAIYthcDVDoOuyW/04JCGPAjE2Isr6+DHiHegIpWmMAOpfcpb4U
         6Xr6Vg4pnYXaE5B1Ji98M1EGus5CND0EDxJlhu3hOH+XXNAFP+jPS5l7xBe7zOEiRMFg
         kqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CT9GqLY0BruZCbulKamF3sFh9+aJmP2cftODhJk3Kmw=;
        b=qMrscMsAMNBHEBudX5taC7hQEg6ccN85DqJmfE0acpqB0mPUesxegxhdfYhYO08ISF
         tMLyHz/5+by4bHnjeK3BLzdM3MA34kwjN2/9amLUJu4jLQcLh64VVkugCrGYWPV9xTvE
         3obFcb10DPe8vCpH0uMdKBs1Fs9kphJoySsUo3Gm9Y3tVbutNGAX15xygPNP93FO9Iij
         JFVkm6EIOX1cydbWamzTS3UqBzj/8z97xGaFLcmk2GbmUIsir08oEg7kKIuuGffL238t
         Dt8MVuCj6qDuQyIctMs6DYBNRETxrIci6kZh+CTkSq/s7j806FWfU5m6fvDbW9Q8IS0T
         x/qw==
X-Gm-Message-State: APjAAAVYcVKz7W2Z+wpqecIErN4sMtTtCnE18Z07SO79BcN+vlytrJSs
        nWgJ8m64C78vjbpt/NPyoWeRQnl+mJ8h1429Jb0/ysDo0/Q=
X-Google-Smtp-Source: APXvYqxUtgWz7UDyASun5JkoSvnT/fcz7WF9MV3zZUgcN4BH066gw+fPZLVja50Rmlgxx4p55TxKEwa4+LstjESx3e0=
X-Received: by 2002:a81:4c13:: with SMTP id z19mr2814282ywa.466.1576132726494;
 Wed, 11 Dec 2019 22:38:46 -0800 (PST)
MIME-Version: 1.0
References: <20191212160622.021517d3@canb.auug.org.au> <20191212060200.GW2889@paulmck-ThinkPad-P72>
In-Reply-To: <20191212060200.GW2889@paulmck-ThinkPad-P72>
From:   Eric Dumazet <edumazet@google.com>
Date:   Wed, 11 Dec 2019 22:38:34 -0800
Message-ID: <CANn89iKJhsMLUBNbkXSr1+t+38POFU8jWrP+tU3JWLjs__HuPw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the rcu tree
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Dec 11, 2019 at 10:02 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Thu, Dec 12, 2019 at 04:06:22PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the rcu (I think) tree, today's linux-next build (x86_64
> > allnoconfig) produced this warning:
> >
> > kernel/time/timer.c: In function 'schedule_timeout':
> > kernel/time/timer.c:969:20: warning: 'timer.expires' may be used uninitialized in this function [-Wmaybe-uninitialized]
> >   969 |   long diff = timer->expires - expires;
> >       |               ~~~~~^~~~~~~~~
> >
> > Introduced by (bisected to) commit
> >
> >   c4127fce1d02 ("timer: Use hlist_unhashed_lockless() in timer_pending()")
> >
> > x86_64-linux-gnu-gcc (Debian 9.2.1-21) 9.2.1 20191130
>
> Well, if the timer is pending, then ->expires has to have been
> initialized, but off where the compiler cannot see it, such as during a
> previous call to __mod_timer().  And the change may have made it harder
> for the compiler to see all of these relationships, but...
>
> I don't see this warning with gcc version 7.4.0.  Just out of curiosity,
> what are you running, Stephen?
>
> Eric, any thoughts for properly educating the compiler on this one?

Ah... the READ_ONCE() apparently turns off the compiler ability to
infer that this branch should not be taken.

Since __mod_timer() is inlined we could perhaps add a new option

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 4820823515e9..8bbce552568b 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -944,6 +944,7 @@ static struct timer_base *lock_timer_base(struct
timer_list *timer,

 #define MOD_TIMER_PENDING_ONLY         0x01
 #define MOD_TIMER_REDUCE               0x02
+#define MOD_TIMER_NOTPENDING           0x04

 static inline int
 __mod_timer(struct timer_list *timer, unsigned long expires, unsigned
int options)
@@ -960,7 +961,7 @@ __mod_timer(struct timer_list *timer, unsigned
long expires, unsigned int option
         * the timer is re-modified to have the same timeout or ends up in the
         * same array bucket then just return:
         */
-       if (timer_pending(timer)) {
+       if (!(options & MOD_TIMER_NOTPENDING) && timer_pending(timer)) {
                /*
                 * The downside of this optimization is that it can result in
                 * larger granularity than you would get from adding a new
@@ -1891,7 +1892,7 @@ signed long __sched schedule_timeout(signed long timeout)

        timer.task = current;
        timer_setup_on_stack(&timer.timer, process_timeout, 0);
-       __mod_timer(&timer.timer, expire, 0);
+       __mod_timer(&timer.timer, expire, MOD_TIMER_NOTPENDING);
        schedule();
        del_singleshot_timer_sync(&timer.timer);
