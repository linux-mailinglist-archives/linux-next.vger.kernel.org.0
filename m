Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEC6E98059
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 18:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbfHUQjl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Aug 2019 12:39:41 -0400
Received: from namei.org ([65.99.196.166]:40402 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729380AbfHUQji (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Aug 2019 12:39:38 -0400
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id x7LGdJ2Z010584;
        Wed, 21 Aug 2019 16:39:19 GMT
Date:   Wed, 21 Aug 2019 09:39:19 -0700 (PDT)
From:   James Morris <jmorris@namei.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Kees Cook <keescook@chromium.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthew Garrett <mjg59@google.com>,
        Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: linux-next: build failure after merge of the security tree
In-Reply-To: <20190819132119.7349e881@canb.auug.org.au>
Message-ID: <alpine.LRH.2.21.1908210938550.7992@namei.org>
References: <20190812145823.63d77573@canb.auug.org.au> <201908121033.BFBE9516AC@keescook> <20190819132119.7349e881@canb.auug.org.au>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 19 Aug 2019, Stephen Rothwell wrote:

> > > 2.20.1
> 
> I am still applying that patch ...
> 

Matthew folded it into commit e6b1db98cf4d54d9ea59cfcc195f70dc946fdd38.


-- 
James Morris
<jmorris@namei.org>

