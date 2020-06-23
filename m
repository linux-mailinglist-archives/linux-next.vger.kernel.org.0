Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3321F206709
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 00:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387701AbgFWWOC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Jun 2020 18:14:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:47806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387609AbgFWWOB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Jun 2020 18:14:01 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A17D420724;
        Tue, 23 Jun 2020 22:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592950441;
        bh=i4JI7Wlg1bRXKCVQ70zwdpyCQhPCsjcBPSKZS7v3IWY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=g5GRLEgnX5RuHYiIAAHJ6VpF3ogoy853hF421Cx+cQgz/pXWZFIZH1CtC+B84295Y
         CNuKhhNNjrMQM9B2sRZxhAAd4gxM+Cpww9KuiSxk7fWmRvE7cNA4z+06q7CD1p89yX
         Z/GT/1ck/+Kpwmf5VxbKY9yDkv1VfuhFAoUpUYPo=
Date:   Wed, 24 Jun 2020 00:13:57 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Cristian Klein <cristian.klein@elastisys.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: linux-next: build failures after merge of the hid tree
In-Reply-To: <20200623103736.25f67de5@canb.auug.org.au>
Message-ID: <nycvar.YFH.7.76.2006240012170.13242@cbobk.fhfr.pm>
References: <20200621140421.7f4552df@canb.auug.org.au> <20200623103736.25f67de5@canb.auug.org.au>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 23 Jun 2020, Stephen Rothwell wrote:

> > I don't know what caused it, but commit
> > 
> >   470376737e88 ("HID: allow building hid.ko as an external module")
> > 
> > did not fix it.  BTW, I build with "make O=...".

That's actually the patch that almost certainly broke it.

CCing Cristian (author of that patch) and Nathan, who apparently sent a 
fixup patch for this, but I haven't seen it, as our corporate mailserver 
had severe issues yesterday.

If there is no resolution by tomorrow, we'll just drop it.

-- 
Jiri Kosina
SUSE Labs

