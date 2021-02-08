Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90578313F3F
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 20:38:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232499AbhBHTi0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Mon, 8 Feb 2021 14:38:26 -0500
Received: from cloudserver094114.home.pl ([79.96.170.134]:47738 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236441AbhBHTiO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2021 14:38:14 -0500
X-Greylist: delayed 394 seconds by postgrey-1.27 at vger.kernel.org; Mon, 08 Feb 2021 14:38:14 EST
Received: from localhost (127.0.0.1) (HELO v370.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_smtp) via UNIX with SMTP (IdeaSmtpServer 0.83.537)
 id 026a27ef7ca5af17; Mon, 8 Feb 2021 20:30:52 +0100
Received: from kreacher.localnet (89-64-80-68.dynamic.chello.pl [89.64.80.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by v370.home.net.pl (Postfix) with ESMTPSA id 530496608B3;
        Mon,  8 Feb 2021 20:30:51 +0100 (CET)
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: linux-next: build failure after merge of the pm tree
Date:   Mon, 08 Feb 2021 20:30:50 +0100
Message-ID: <3936997.7vkU7uULjK@kreacher>
In-Reply-To: <CAHp75Vdrnmnu3vfmtEmnU=dH9tjoZtSZUtgDNXp29E90tT+j7A@mail.gmail.com>
References: <20210205115153.799dc024@canb.auug.org.au> <CAHp75VfiyAtxg+wqZ30kSzCfFFsLndLjzrUc1njZG0x6vQeyBQ@mail.gmail.com> <CAHp75Vdrnmnu3vfmtEmnU=dH9tjoZtSZUtgDNXp29E90tT+j7A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrtddtgddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfjqffogffrnfdpggftiffpkfenuceurghilhhouhhtmecuudehtdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkfgjfhgggfgtsehtqhertddttdejnecuhfhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqnecuggftrfgrthhtvghrnhepieejkeefheegjefffeevffegheehteeuveduuedttddvteeugeduheeiieehfeevnecukfhppeekledrieegrdektddrieeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkeelrdeigedrkedtrdeikedphhgvlhhopehkrhgvrggthhgvrhdrlhhotggrlhhnvghtpdhmrghilhhfrhhomhepfdftrghfrggvlhculfdrucghhihsohgtkhhifdcuoehrjhifsehrjhifhihsohgtkhhirdhnvghtqedprhgtphhtthhopegrnhguhidrshhhvghvtghhvghnkhhosehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthes
 vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhg
X-DCC--Metrics: v370.home.net.pl 1024; Body=6 Fuz1=6 Fuz2=6
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Friday, February 5, 2021 12:15:22 PM CET Andy Shevchenko wrote:
> On Fri, Feb 5, 2021 at 11:14 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Friday, February 5, 2021, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> >> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> >> failed like this:
> >>
> >
> > Rafael, maybe I was unclear when explaining to you the dependencies with the series of series, but all three parts should go ordered. In any case it’s easy to fix. I will send you a PR late today of the immutable tag (part 1) that needs to be included in order to avoid the above.
> 
> PR had just been sent to linux-acpi@ and Rafael in Cc.

I haven't seen that PR, though, in any of my inboxes etc.

Can you please point me to an archive or similar where I can find it?

Cheers!



