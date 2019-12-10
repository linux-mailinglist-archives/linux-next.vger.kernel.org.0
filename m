Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 341B3118E22
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2019 17:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbfLJQuT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Dec 2019 11:50:19 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43964 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbfLJQuT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Dec 2019 11:50:19 -0500
Received: by mail-lj1-f195.google.com with SMTP id a13so20691412ljm.10
        for <linux-next@vger.kernel.org>; Tue, 10 Dec 2019 08:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uJBPNo5Ifpm4b2jx5CbDzjmnEU5Idos92xl1yp2IpZ4=;
        b=zrIO+Yz9oIcKVXb/1H+NHkasIJPZbw58jnP73LEmVuKzEev5Rs62uerQouXhG641Iy
         7jmQysaPyNd8eTPv5t4jeSK7EN/d5svDFhDlUgBkmGAne8IF62Nxd1ba+FwaZHN6RT/i
         T1ZDciEFuNEmWyjOXamrhUmgy+zuG+BglFSSFy4tfJSlRpKCBAvusSU+IDSeRGGT5RD+
         fLXwAjTy/cnQsYn1+yD1ywTYRlDZsVIEZyfgoOL6Oa9cRC3Cqq7zJAxyvV/VJtE+AybG
         a/IJ/9mjCwg1CyZXF5DleAL8nOOipz/egrsXRrXEwbyToS/RchsEKHVGHpazr/lOCrb0
         Tvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uJBPNo5Ifpm4b2jx5CbDzjmnEU5Idos92xl1yp2IpZ4=;
        b=Bq966SP0UPwGv/NgoWdBXjqEh0IJ7QYE+fk0m+8ODTgB8c26rOB7NC9EOWKglme4R0
         PLzixTatknOgQxHm+J9SlTc8uUWLzI2uZfjB8mbs0xfkHzfXR9xhxXfaoMkVIDEzPl24
         HpBCRmnVTpjoxNZTx0WXJ4pXS6sQQDEFHiaOcBo7/5F9visB5UofZjl0qTxbOuwtjdtj
         QD66DrUfLVCZ3GrF5E9ezaWn0eOsOtuhTiTYwu+ybhXBu8QJ6V/aK5go4leL0GIgKmtJ
         5t/+dPgynvLlCJfI6w12jVp87MMdubYw0oGamV9wPGEprsWOCtVohsfgdl+aRd92k/rw
         PJkA==
X-Gm-Message-State: APjAAAXzteji5O8HUpb2PtnFxFgKGwsh5kGJdhcKEVl5wjIZZ9ZLbkDB
        eFLolRvd/boPjjtErinP0Aeq8+jw/cVNVkGbVuif
X-Google-Smtp-Source: APXvYqyWdr9mcOoFo4b/o0BKQ+PHnICc0npi2+looo9Uq+PMFdu0R+Bw+EYmYoD3Yg3gAF7xvxq7gCpJhmMbYwdMk4w=
X-Received: by 2002:a2e:4704:: with SMTP id u4mr21464693lja.117.1575996617044;
 Tue, 10 Dec 2019 08:50:17 -0800 (PST)
MIME-Version: 1.0
References: <157594493094.748324.9234611948545428995.stgit@chester>
 <285edbb5-b08e-5bdc-f951-841fe1d77521@tycho.nsa.gov> <CAHC9VhS4ksmcqBMzwQDArgd9xn_cJ+nyEBrHJcYjoiMaFzCq-Q@mail.gmail.com>
 <a11bfefc-c010-36ca-2303-35dcd4e9aa41@tycho.nsa.gov> <CAHC9VhRjs-pMWD-2ZTcF42eR3ugW7Bn7uYhmp4cQFneOtcqUkg@mail.gmail.com>
 <85a3c4ce-0636-30e7-21bf-dfcd4be5cd9c@tycho.nsa.gov>
In-Reply-To: <85a3c4ce-0636-30e7-21bf-dfcd4be5cd9c@tycho.nsa.gov>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 10 Dec 2019 11:50:06 -0500
Message-ID: <CAHC9VhSNO+e5Db2yY9roQNirAPy9B+BQ6q_x1oB6PbvOcK5TZQ@mail.gmail.com>
Subject: Re: [RFC PATCH] security: add an interface to lookup the lockdown reason
To:     Stephen Smalley <sds@tycho.nsa.gov>
Cc:     selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-next@vger.kernel.org, jamorris@linux.microsoft.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 10, 2019 at 11:20 AM Stephen Smalley <sds@tycho.nsa.gov> wrote:
> On 12/10/19 10:58 AM, Paul Moore wrote:
> > On Tue, Dec 10, 2019 at 10:45 AM Stephen Smalley <sds@tycho.nsa.gov> wrote:
> >> On 12/10/19 10:04 AM, Paul Moore wrote:
> >>> On Tue, Dec 10, 2019 at 9:59 AM Stephen Smalley <sds@tycho.nsa.gov> wrote:
> >>>> On 12/9/19 9:28 PM, Paul Moore wrote:
> >>>>> With CONFIG_AUDIT enabled but CONFIG_SECURITY disabled we run into
> >>>>> a problem where the lockdown reason table is missing.  This patch
> >>>>> attempts to fix this by hiding the table behind a lookup function.
> >>>>
> >>>> Shouldn't lsm_audit.c be conditional on both CONFIG_AUDIT and
> >>>> CONFIG_SECURITY?  When/why would we want it built without
> >>>> CONFIG_SECURITY enabled?
> >>>
> >>> My first thought of a fix was just that, but I remembered that the
> >>> capabilities code is built regardless of the CONFIG_SECURITY setting
> >>> and I thought there might be some value in allowing for lsm_audit to
> >>> be used in commoncap (although in full disclosure commoncap doesn't
> >>> currently make use of lsm_audit).
> >>
> >> Seems contrary to normal practice, i.e. if/when commoncap grows a
> >> dependency, it can be changed then.
> >
> > Okay, want to submit a tested patch?  I really would like to get this
> > fixed before today's linux-next run.
>
> In looking at it, I'm wondering if we could just change the Makefile to
> use obj-$(CONFIG_SECURITY) instead of obj-$(CONFIG_AUDIT) for
> lsm_audit.c.  I think it might build just fine without CONFIG_AUDIT
> since audit.h provides static inlines that boil away to nothing for
> audit_log*() in that case. Offhand I don't see any support/examples of
> specifying two different config options for an obj list in a Makefile.

That should work too I think.

> The other option would be to introduce its own CONFIG_LSM_AUDIT option
> and select that option automatically for the modules that use it, which
> would currently be selinux, apparmor, and smack.  Then if you aren't
> using any of those modules you can omit it from your kernel.

This seems to be both the right thing to do, as well as overly complicated :)

I'm not sure I have a strong preference at this point, other than
getting it fixed.

-- 
paul moore
www.paul-moore.com
