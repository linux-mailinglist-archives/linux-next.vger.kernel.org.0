Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00EE2A5018
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 09:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729702AbfIBHmn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 03:42:43 -0400
Received: from mail.heine.tech ([195.201.24.99]:59284 "EHLO mail.heine.tech"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726540AbfIBHmn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 03:42:43 -0400
X-Greylist: delayed 593 seconds by postgrey-1.27 at vger.kernel.org; Mon, 02 Sep 2019 03:42:42 EDT
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: michael@nosthoff.rocks)
        by mail.heine.tech (Postcow) with ESMTPA id 0C7951814BA;
        Mon,  2 Sep 2019 09:32:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nosthoff.rocks;
        s=dkim; t=1567409568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
        bh=JX2/x2Fpnilt3YxCUMwW5hYCNP+HOh2fh/yrCcqpfvQ=;
        b=J76ZiGdK8Y8frci+PP36sETn4Ys5AjkBijg1nzhyOTdG6TmXvQZduu0sdF+BzkCWj6NKTL
        3vDsUbYcMOQzf20c+atRE0vudaSEg+GgfKFyP4gZWdmh4e42Sl5d5XqMRomOoMlon0lMci
        xYBaboQ/h0/Lhk+Mj70Mh93gPlWeqnk=
Content-Type: text/plain; charset="utf-8"
In-Reply-To: <20190902071041.ukvc64tg5tjttk6w@earth.universe>
From:   "Michael Nosthoff" <michael@nosthoff.rocks>
Date:   Mon, 02 Sep 2019 09:32:47 +0200
Cc:     "Stephen Rothwell" <sfr@canb.auug.org.au>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
To:     "Sebastian Reichel" <sre@kernel.org>
MIME-Version: 1.0
Message-ID: <79b6-5d6cc580-3-35015040@57153312>
Subject: =?utf-8?q?Re=3A?==?utf-8?q?_linux-next=3A?= Fixes tag needs some work in 
 the battery tree
User-Agent: SOGoMail 4.0.8
Content-Transfer-Encoding: quoted-printable
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=nosthoff.rocks;
        s=dkim; t=1567409568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to; bh=JX2/x2Fpnilt3YxCUMwW5hYCNP+HOh2fh/yrCcqpfvQ=;
        b=Z3HDkULOYVoIMvU9ddzW4tOX5r8fU2VGjP5iUEaAy3oD6pVKkWzOAERH+5erlX/84IKveH
        vUzflOjvpzWAvMchDFjlZGIaIvZJbmdurvS4G+OlnBMyOC/AyFKBQ0UPIwLvC++NS9rPu+
        dgz5hMMm3lIfktr2t9aw5/ZvjLN07Yw=
ARC-Seal: i=1; s=dkim; d=nosthoff.rocks; t=1567409568; a=rsa-sha256;
        cv=none;
        b=VIBLveKhDw6arNCEsJeZylZEauLRE64oRt1XoM0Ch6zIaNIWMGBxcT5gX6tsSryxTDOyhT
        BoCgieTBgKW8x7MBELA8m85jYytlmRRoMvGKs0Q2B2LTyjdmX1s/KP91sYon1Vj5Z68CWU
        SGBj4udBNwFV2ufL8oV48vsbtHVePqI=
ARC-Authentication-Results: i=1;
        mail.heine.tech;
        auth=pass smtp.mailfrom=michael@nosthoff.rocks
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Sebastian,

I think you missed that the second commit

38fa8b9f75ea ("power: supply: sbs-battery: use correct flags field")

also needs this fix.


Regards,
Michael

On Monday, September 02, 2019 09:10 CEST, Sebastian Reichel <sre@kernel=
.org> wrote: 
 
> Hi Stephen,
> 
> On Mon, Sep 02, 2019 at 09:31:31AM +1000, Stephen Rothwell wrote:
> > In commit
> > 
> > b19aca4eb2d2 ("power: supply: sbs-battery: only return health when =
battery present")
> > 
> > [...]
> > 
> > Please do not split Fixes tags over more than one line.
> 
> I have fixed this and rebased the branch, so the issue should be
> gone tomororw. Thanks for the notice,
> 
> -- Sebastian

