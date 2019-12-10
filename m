Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21C11118D20
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2019 16:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbfLJP6V (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Dec 2019 10:58:21 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44923 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727411AbfLJP6V (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Dec 2019 10:58:21 -0500
Received: by mail-lj1-f194.google.com with SMTP id c19so20427867lji.11
        for <linux-next@vger.kernel.org>; Tue, 10 Dec 2019 07:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LEzPIee6pNHus2hM7ukA0TFs/leUR3YoNGkCo+m7X+8=;
        b=OcdWiwF2IPFEXVinDWDs9r34D/0XBAsh1i51ZzLjkBEMZ6IU+w5A5OvzU3FUT5AP6y
         EHZo0EfxBSMMisP/aeUu2gXQR9N0Mk1hrRvRsb6zio84jSEB6R87QhfAS03FOvF8jIl3
         /eJr4w4Kap6iPb2CCQqLpVd7yvu02IbbOKYnW0gAWNHYccRIDuAVZwE+/KrzYRXCm+xq
         7nVNsW5de7Z42ryhoPPRnlkedRZCGy5JMz/NMFg5ISc9+jItwy0S38S1ZoR25tmzdOnK
         m32BXquYyjkah3nQ9+xInHLP3l7ouPs+4AtSOZnIq0FS4p6X+FlhhdFxq3IQrYhOn1dS
         RvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LEzPIee6pNHus2hM7ukA0TFs/leUR3YoNGkCo+m7X+8=;
        b=TdoQUvyA9w+vZkxC+r+MP686MufHrSfg8TjxwSlNod/SKxtlbHVNsEkwxMR2vrvj4w
         ITIE135eBJn2kAhIWd3/o7dJCYw41ePxMhqdGAq8lBmsQRg87p6nIA0eCZyDC/18UIYa
         zkk1AikmFGO4RnAnTdj2TZUiIi6687xZbNgCBAatkZ0QT6/bYdh7Ikt1G7XPXjvUaS4y
         akxkj10ne7ksmYJDmSrOG9hJxQFFWVQFxFz7vkom0XH5fbyTMieAG56UdxKm7CoH55ko
         urMVNuutTAFt9zolNsXxoS8CEp1nbSGylbrPqB4j2K8idSbMpPEWibEXYnqAn8SnoQAN
         GO7Q==
X-Gm-Message-State: APjAAAV+tyhoUe1CdJr9OcinFt+m8gIPURz3suyHv4vz0ov1rvIOWcHq
        zMOYUwkASdmBQuni5sA5CCQ/ij1rBvVSkUN0+9zU
X-Google-Smtp-Source: APXvYqxXbSn/v5tMZSkgXLe21RUKVQldm8wnVs/okHayFlloRlBWnIs3FHi60D2H2iBj03JLYgmeGDbuiwUAo1b2Rc8=
X-Received: by 2002:a2e:99cd:: with SMTP id l13mr6865932ljj.243.1575993499711;
 Tue, 10 Dec 2019 07:58:19 -0800 (PST)
MIME-Version: 1.0
References: <157594493094.748324.9234611948545428995.stgit@chester>
 <285edbb5-b08e-5bdc-f951-841fe1d77521@tycho.nsa.gov> <CAHC9VhS4ksmcqBMzwQDArgd9xn_cJ+nyEBrHJcYjoiMaFzCq-Q@mail.gmail.com>
 <a11bfefc-c010-36ca-2303-35dcd4e9aa41@tycho.nsa.gov>
In-Reply-To: <a11bfefc-c010-36ca-2303-35dcd4e9aa41@tycho.nsa.gov>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 10 Dec 2019 10:58:08 -0500
Message-ID: <CAHC9VhRjs-pMWD-2ZTcF42eR3ugW7Bn7uYhmp4cQFneOtcqUkg@mail.gmail.com>
Subject: Re: [RFC PATCH] security: add an interface to lookup the lockdown reason
To:     Stephen Smalley <sds@tycho.nsa.gov>
Cc:     selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-next@vger.kernel.org, jamorris@linux.microsoft.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 10, 2019 at 10:45 AM Stephen Smalley <sds@tycho.nsa.gov> wrote:
> On 12/10/19 10:04 AM, Paul Moore wrote:
> > On Tue, Dec 10, 2019 at 9:59 AM Stephen Smalley <sds@tycho.nsa.gov> wrote:
> >> On 12/9/19 9:28 PM, Paul Moore wrote:
> >>> With CONFIG_AUDIT enabled but CONFIG_SECURITY disabled we run into
> >>> a problem where the lockdown reason table is missing.  This patch
> >>> attempts to fix this by hiding the table behind a lookup function.
> >>
> >> Shouldn't lsm_audit.c be conditional on both CONFIG_AUDIT and
> >> CONFIG_SECURITY?  When/why would we want it built without
> >> CONFIG_SECURITY enabled?
> >
> > My first thought of a fix was just that, but I remembered that the
> > capabilities code is built regardless of the CONFIG_SECURITY setting
> > and I thought there might be some value in allowing for lsm_audit to
> > be used in commoncap (although in full disclosure commoncap doesn't
> > currently make use of lsm_audit).
>
> Seems contrary to normal practice, i.e. if/when commoncap grows a
> dependency, it can be changed then.

Okay, want to submit a tested patch?  I really would like to get this
fixed before today's linux-next run.

-- 
paul moore
www.paul-moore.com
